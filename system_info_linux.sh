#!/bin/bash

LOG_FILE="/var/log/system_report.log"

echo "=== System Report - $(date) ===" >> $LOG_FILE
echo "Hostname: $(hostname)" >> $LOG_FILE
echo "Uptime: $(uptime)" >> $LOG_FILE
echo "CPU Info: $(lscpu | grep 'Model name')" >> $LOG_FILE
echo "Memory Info:" >> $LOG_FILE
free -h >> $LOG_FILE
echo "Disk Usage:" >> $LOG_FILE
df -h / >> $LOG_FILE
echo "---------------------------------" >> $LOG_FILE