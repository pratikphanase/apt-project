param (
    [Parameter(Mandatory=$true)]
    [string]$AlbDnsName
)

Write-Host "Testing GET http://$AlbDnsName/ ..."
try {
    $response = Invoke-WebRequest -Uri "http://$AlbDnsName/" -UseBasicParsing
    Write-Host $response.Content
} catch {
    Write-Error "Request failed: $_"
}
Write-Host ""

Write-Host "Testing GET http://$AlbDnsName/health ..."
try {
    $response = Invoke-WebRequest -Uri "http://$AlbDnsName/health" -UseBasicParsing
    Write-Host $response.Content
} catch {
    Write-Error "Request failed: $_"
}
Write-Host ""
