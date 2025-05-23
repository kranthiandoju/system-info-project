#!/bin/bash

#Project1: Testing  Macbook Info Reporter Script (Locally on MacBook)
LOG_FILE="/tmp/system_report.log"

# Clear previous log file if exists
> "$LOG_FILE"

echo "=== TK1 System Report - $(date) ===" >> "$LOG_FILE"
echo "Hostname: $(hostname)" >> "$LOG_FILE"

echo "Uptime:" >> "$LOG_FILE"
uptime >> "$LOG_FILE"

echo "CPU Info:" >> "$LOG_FILE"
sysctl -n machdep.cpu.brand_string >> "$LOG_FILE"

echo "Memory Info:" >> "$LOG_FILE"
vm_stat >> "$LOG_FILE"

echo "DiskKK Usage:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

echo "---------------------------------" >> "$LOG_FILE"

echo "System info report has been saved to $LOG_FILE"
#Run the command in terminal: cat /tmp/system_report.log