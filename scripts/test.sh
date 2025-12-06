#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <ALB_DNS_NAME>"
  exit 1
fi

ALB_DNS=$1

echo "Testing GET http://$ALB_DNS/ ..."
curl -s "http://$ALB_DNS/"
echo ""

echo "Testing GET http://$ALB_DNS/health ..."
curl -s "http://$ALB_DNS/health"
echo ""
