#!/bin/bash
set -e
systemctl stop nginx || true
mkdir -p /usr/share/nginx/html
