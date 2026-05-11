#!/bin/bash
# Resource Monitoring Script

echo "=== System Resource Monitor ==="
echo "Date: $(date)"
echo ""

echo "[1] CPU Usage:"
# Getting top 5 CPU consuming processes and overall usage
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Idle: " $1 "%"}'
echo "Top 5 CPU consuming processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""

echo "[2] Memory Usage:"
free -m
echo ""

echo "[3] Disk Storage Usage:"
df -h
echo ""

echo "=== End of Report ==="
