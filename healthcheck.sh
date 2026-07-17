#!/bin/bash

# ============================================================
# ProLEAP Academy
# EC2 Linux Health Check Script
# Author  : Saumyaranjan Roul
# Platform: Ubuntu EC2
# Purpose : Collect system health information and generate
#           a timestamped report.
# ============================================================

# -----------------------------
# Variables
# -----------------------------
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
REPORT_DIR="reports"
REPORT_FILE="${REPORT_DIR}/health-report-${TIMESTAMP}.txt"

mkdir -p "$REPORT_DIR"

# -----------------------------
# Helper Function
# -----------------------------
print_header() {
    echo
    echo "==========================================================="
    echo "$1"
    echo "==========================================================="
}

# -----------------------------
# System Information
# -----------------------------
system_information() {

    print_header "SYSTEM INFORMATION"

    echo "Report Generated : $(date)"
    echo "Hostname         : $(hostname)"
    echo "Logged-in User   : $(whoami)"
    echo "Operating System : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
    echo "Kernel Version   : $(uname -r)"
    echo "System Uptime    : $(uptime -p)"
}

# -----------------------------
# CPU Information
# -----------------------------
cpu_information() {

    print_header "CPU INFORMATION"

    echo "CPU Load Average : $(uptime | awk -F'load average:' '{print $2}')"

}

# -----------------------------
# Memory Information
# -----------------------------
memory_information() {

    print_header "MEMORY UTILIZATION"

    free -h

}
# -----------------------------
# Disk Information
# -----------------------------
disk_information() {

    print_header "DISK UTILIZATION"

    df -h /

}

# -----------------------------
# Network Information
# -----------------------------
network_information() {

    print_header "NETWORK INFORMATION"

    echo "IP Address(es):"
    hostname -I

}

# -----------------------------
# Top Memory Processes
# -----------------------------
process_information() {

    print_header "TOP 5 MEMORY-CONSUMING PROCESSES"

    ps -eo pid,user,%mem,%cpu,comm --sort=-%mem | head -6

}

# -----------------------------
# Running Services
# -----------------------------
service_information() {

    print_header "RUNNING SERVICES"

    echo "Running Services : $(systemctl list-units --type=service --state=running --no-legend | wc -l)"

    echo
    echo "Failed Services"
    echo "---------------"

    FAILED=$(systemctl --failed --no-legend)

    if [ -z "$FAILED" ]; then
        echo "No failed services found."
    else
        echo "$FAILED"
    fi

}

# -----------------------------
# Listening Ports
# -----------------------------
listening_ports() {

    print_header "LISTENING PORTS"

    ss -tuln

}
# -----------------------------
# Main Program
# -----------------------------
main() {

    system_information
    cpu_information
    memory_information
    disk_information
    network_information
    process_information
    service_information
    listening_ports

}

# -----------------------------
# Execute Script
# -----------------------------
main | tee "$REPORT_FILE"

echo
echo "==========================================================="
echo "HEALTH CHECK COMPLETED SUCCESSFULLY"
echo "==========================================================="
echo "Health report saved successfully."
echo "Report Location : $REPORT_FILE"
