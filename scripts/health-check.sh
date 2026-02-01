#!/bin/bash
# Simple System Health Check Script (with color coding)

# Colors
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
NC="\033[0m"   # No Color

echo -e "${GREEN}===== SYSTEM HEALTH CHECK =====${NC}"
echo

echo -e "${GREEN}CPU Usage:${NC}"
top -bn1 | head -5
echo

echo -e "${GREEN}Memory Usage:${NC}"
free -h
echo

echo -e "${GREEN}Disk Usage:${NC}"
df -h
echo

echo -e "${YELLOW}Running Processes Count:${NC}"
ps aux | wc -l
echo

echo -e "${YELLOW}Network Connections:${NC}"
ss -tun | head
echo

echo -e "${GREEN}Last 5 System Logins:${NC}"
last -n 5
echo

echo -e "${GREEN}System Load Average:${NC}"
uptime
echo

echo -e "${GREEN}===== HEALTH CHECK COMPLETE =====${NC}"

