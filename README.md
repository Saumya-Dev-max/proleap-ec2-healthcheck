# ProLEAP EC2 Health Check

## Project Description

This project is a practical assignment developed as part of **ProLEAP Academy** to demonstrate Git, GitHub, and Linux administration skills using an AWS EC2 Ubuntu instance.

The project includes a Bash-based Linux health-check script that collects important system information, generates a timestamped health report, and demonstrates a complete Git workflow including cloning, committing, pushing, branching, merging, pulling, synchronization, and fresh-clone validation.

---

# Features

* Linux EC2 health-check script
* Timestamped health report generation
* System information collection
* CPU load monitoring
* Memory utilization
* Disk utilization
* IP address information
* Top five memory-consuming processes
* Running services count
* Failed systemd services
* Listening ports
* Automatic report generation inside the `reports/` directory
* Git workflow demonstration using GitHub

---

# Prerequisites

Before running this project, ensure the following requirements are met:

* Ubuntu AWS EC2 Instance
* Git installed
* Bash shell
* SSH access to EC2
* GitHub account
* Configured Git username and email

---

# Installation

Clone the repository:

```bash
git clone git@github.com:<your-github-username>/proleap-ec2-healthcheck.git
```

Move into the project directory:

```bash
cd proleap-ec2-healthcheck
```

---

# Execution Steps

Make the script executable:

```bash
chmod +x healthcheck.sh
```

Run the script:

```bash
./healthcheck.sh
```

---

# Generated Reports

Each execution creates a timestamped report inside the `reports` directory.

Example:

```text
reports/health-report-20260717-103000.txt
```

Automatically generated reports are ignored by Git using `.gitignore`.

---

# Project Structure

```text
proleap-ec2-healthcheck
│
├── README.md
├── healthcheck.sh
├── .gitignore
│
├── reports
│   ├── sample-health-report.txt
│   └── health-report-YYYYMMDD-HHMMSS.txt
│
└── docs
    └── execution-guide.md
```

---

# Git Workflow

The following Git operations are demonstrated in this project:

* Repository creation
* Repository cloning
* Git configuration
* File tracking
* Commit creation
* Push to GitHub
* Feature branch creation
* Branch merge
* Pull remote changes
* Repository synchronization
* Fresh clone validation

---

# Author

**Student Name:** Saumyaranjan Roul

**Organization:** ProLEAP Academy

---

# License

This project is created for educational purposes as part of the ProLEAP Academy practical assignment.

