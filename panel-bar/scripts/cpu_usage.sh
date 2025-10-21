#!/bin/bash
# CPU Usage Script - Single Responsibility: Get CPU usage percentage

# Get CPU usage using top command
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//')
echo "$cpu_usage"
