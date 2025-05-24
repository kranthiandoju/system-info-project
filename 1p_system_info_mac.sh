#!/bin/bash

LOG_FILE="/tmp/system_report.log"
> "$LOG_FILE"

echo "=== TK2 MacBook System Report - $(date) ===" >> "$LOG_FILE"
echo "Hostname: $(hostname)" >> "$LOG_FILE"

echo "Uptime:" >> "$LOG_FILE"   
uptime >> "$LOG_FILE"

echo "CPU Info:" >> "$LOG_FILE"
sysctl -n machdep.cpu.brand_string >> "$LOG_FILE"

echo "Disk Usage:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

echo "---------------------------------" >> "$LOG_FILE"

# AWS Info
echo "AWS Active EC2 Instances:" >> "$LOG_FILE"
aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,LaunchTime]" \
  --output table >> "$LOG_FILE"

echo "---------------------------------" >> "$LOG_FILE"