#!/bin/bash
# Simple Log Analysis Script

LOG_FILE="logs/access.log"

echo "===== LOG ANALYSIS ====="

# 1. Total requests
echo "Total Requests:"
wc -l "$LOG_FILE"

# 2. Top 10 IP addresses
echo
echo "Top 10 IP Addresses:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

# 3. Requests by HTTP status code
echo
echo "Requests by Status Code:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c

# 4. Most accessed endpoints
echo
echo "Most Accessed Endpoints:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

# 5. Average response time (last column)
echo
echo "Average Response Time:"
awk '{sum+=$NF} END {print sum/NR}' "$LOG_FILE"

# 6. Potential security issues
echo
echo "404 Errors:"
grep " 404 " "$LOG_FILE" | wc -l

echo "===== ANALYSIS COMPLETE ====="

