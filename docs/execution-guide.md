# EC2 Health Check Script - Execution Guide

## Objective

This document explains how to execute the EC2 Health Check Script on an Ubuntu EC2 instance.

---

# Step 1: Clone the Repository

```bash
git clone git@github.com:<your-github-username>/proleap-ec2-healthcheck.git
```

---

# Step 2: Navigate to the Project Directory

```bash
cd proleap-ec2-healthcheck
```

---

# Step 3: Make the Script Executable

```bash
chmod +x healthcheck.sh
```

---

# Step 4: Execute the Script

```bash
./healthcheck.sh
```

---

# Step 5: Verify the Generated Report

```bash
ls -lh reports
```

Example output:

```
health-report-YYYYMMDD-HHMMSS.txt
sample-health-report.txt
```

---

# Step 6: View the Report

```bash
cat reports/health-report-YYYYMMDD-HHMMSS.txt
```

---

# Troubleshooting

### Permission Denied

If the script is not executable, run:

```bash
chmod +x healthcheck.sh
```

### Script Not Found

Ensure you are inside the project directory:

```bash
pwd
```

### Git Status

Verify the repository status:

```bash
git status
```

Generated timestamped reports are ignored automatically through `.gitignore`.

---

# Expected Result

After successful execution, the script will:

* Display system health information.
* Generate a timestamped report.
* Save the report inside the `reports/` directory.
* Display the report location on the terminal.
## Additional Troubleshooting

If permission is denied while executing the script, run:

```bash
chmod +x healthcheck.sh
```

Then execute the script again.
## Note

This repository demonstrates Git collaboration and synchronization workflows.
