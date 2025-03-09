#!/bin/bash

# Display system information

echo "System Information:"
echo "---------------------"

echo "Hostname: $(hostname)"

echo "Kernel Version: $(uname -r)"

echo "Uptime: $(uptime -p)"

echo "CPU Information:"    
lscpu | grep "Model name"

echo "Memory Usage:"
                
                free -h

echo "Disk Usage:"
                
                df -h