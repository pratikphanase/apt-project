const express = require('express');
const http = require('http');
const app = express();
const port = process.env.PORT || 8080;

// Function to get EC2 Instance Metadata (IMDSv2)
function getMetadata(path) {
    return new Promise((resolve, reject) => {
        // 1. Get IMDSv2 Token
        const tokenReq = http.request({
            hostname: '169.254.169.254',
            path: '/latest/api/token',
            method: 'PUT',
            headers: {
                'X-aws-ec2-metadata-token-ttl-seconds': '21600'
            }
        }, (res) => {
            let token = '';
            res.on('data', (chunk) => token += chunk);
            res.on('end', () => {
                // 2. Use Token to get Metadata
                const req = http.get({
                    hostname: '169.254.169.254',
                    path: '/latest/meta-data/' + path,
                    headers: {
                        'X-aws-ec2-metadata-token': token
                    }
                }, (res) => {
                    let data = '';
                    res.on('data', (chunk) => data += chunk);
                    res.on('end', () => resolve(data));
                });
                req.on('error', reject);
            });
        });
        tokenReq.on('error', () => resolve('Unavailable (not on EC2?)')); // Fallback for local testing
        tokenReq.end();
    });
}

app.get('/', async (req, res) => {
    console.log('Received request for /');
    try {
        const privateIp = await getMetadata('local-ipv4');
        const az = await getMetadata('placement/availability-zone');
        // Note: Subnet ID requires traversing MAC addresses, using AZ as a proxy for network location here for simplicity
        // or we could fetch 'network/interfaces/macs/' then the first mac then 'subnet-id'

        res.send(`
            <h1>Hello from private EC2 behind ALB 👋</h1>
            <p><strong>Private IP:</strong> ${privateIp}</p>
            <p><strong>Availability Zone:</strong> ${az}</p>
        `);
    } catch (error) {
        res.send('Hello from private EC2 behind ALB 👋 (Metadata unavailable)');
    }
});

app.get('/health', (req, res) => {
    console.log('Received request for /health');
    res.status(200).send('ok');
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
