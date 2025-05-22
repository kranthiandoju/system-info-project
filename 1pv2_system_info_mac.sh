#!/bin/bash

LOG_FILE="/tmp/system_report.log"
	
# Clear previous log file
> "$LOG_FILE"

echo "=== System Report - $(date) ===" >> "$LOG_FILE"
echo "Hostname: $(hostname)" >> "$LOG_FILE"

echo "Uptime:" >> "$LOG_FILE"
uptime >> "$LOG_FILE"

echo "CPU Info:" >> "$LOG_FILE"
sysctl -n machdep.cpu.brand_string >> "$LOG_FILE"


echo "Dis Usage:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

echo "---------------------------------" >> "$LOG_FILE"

echo "System info report has been saved to $LOG_FILE"
