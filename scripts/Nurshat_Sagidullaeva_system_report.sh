#!/bin/bash
# System report script
# Author: Sagidullaeva Nurshat (Student ID 41536, group IT2-23.09)
# Prints a system report to the screen AND appends it to the personal log file.

STUDENT_NAME="Sagidullaeva Nurshat"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/../logs/Nurshat_Sagidullaeva_system_report.log"

{
    echo "=============================================="
    echo " SYSTEM REPORT"
    echo "=============================================="
    echo "Student full name : $STUDENT_NAME"
    echo "Date and time     : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Current user      : $(whoami)"
    echo
    echo "--- Operating system and kernel ---"
    if [ -r /etc/os-release ]; then
        . /etc/os-release
        echo "OS     : $PRETTY_NAME"
    fi
    echo "Kernel : $(uname -r)"
    echo
    echo "--- CPU ---"
    lscpu | grep -E 'Model name|^CPU\(s\)|Architecture'
    echo
    echo "--- Memory ---"
    free -h
    echo
    echo "--- Disk usage ---"
    df -h
    echo
    echo "--- Available disk space on / ---"
    df -h --output=source,size,used,avail,pcent / 
    echo
    echo "Report finished for $STUDENT_NAME"
    echo "----------------------------------------------"
    echo
} | tee -a "$LOG_FILE"
