#!/bin/bash
set -e
# Clean old app files so each deploy is fresh
sudo rm -rf /usr/share/nginx/html/*
sudo mkdir -p /usr/share/nginx/html
