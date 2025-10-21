#!/bin/bash
# Memory Usage Script - Single Responsibility: Get memory usage percentage

# Get memory usage using free command
memory_usage=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')
echo "$memory_usage"
