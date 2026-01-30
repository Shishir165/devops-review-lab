#!/bin/bash

echo "========SYSTEM HEALTH CHECK========"
echo
	
echo "CPU usage:"
top -bn1 | head -5
echo

echo "Memory usage:"
free -h
echo

echo "Disk space usage:"
df -h
echo

echo "Running processes count:"
ps aux | wc -l
echo

echo "Network Connections:"
ss -tun | head
echo

echo "Last 5 System Logins:"
last -n 5
echo

echo "System Load Average:"
uptime
echo

echo "===== HEALTH CHECK COMPLETE ====="
	
