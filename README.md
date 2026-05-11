# DevOps Infrastructure Automation & Secure Deployment System

This project is a comprehensive DevOps environment that demonstrates Linux system administration, shell scripting automation, Git-based version control, CI/CD pipeline implementation, code quality analysis (SonarQube), and security policy enforcement (Open Policy Agent).

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── ci-cd-pipeline.yml     # GitHub Actions pipeline
├── config/
│   └── deployment.json            # Sample config for OPA evaluation
├── docs/
│   └── git_workflow.md            # Documentation on Git branching strategy
├── policies/
│   └── infrastructure.rego        # OPA policy for security enforcement
├── scripts/
│   ├── admin/                     # Linux Administration Scripts
│   │   ├── file_mgmt.sh
│   │   ├── permission_mgmt.sh
│   │   ├── process_mgmt.sh
│   │   └── user_mgmt.sh
│   └── monitoring/                # System & Network Monitoring Scripts
│       ├── network_monitor.sh
│       └── resource_monitor.sh
├── sonar-project.properties       # SonarQube configuration
└── README.md
```

## Features

1. **Linux System Administration**: Automated scripts for managing files, users, permissions, and processes.
2. **System Monitoring & Networking**: Automated scripts to monitor CPU/memory/storage and network services/connectivity.
3. **CI/CD Pipeline**: Automated pipeline using GitHub Actions to validate code, run ShellCheck, and enforce policies.
4. **SonarQube Integration**: Static code analysis for bug detection and quality gate enforcement.
5. **OPA Security Enforcement**: Policy-based security validation ensuring secure deployments.

## Usage

### Running Scripts

Make sure scripts are executable before running them. You can use the `permission_mgmt.sh` script or simply:
```bash
chmod +x scripts/*/*.sh
```

**Example:**
```bash
./scripts/monitoring/resource_monitor.sh
```

### Git Workflow

See `docs/git_workflow.md` for information on how to manage the repository source code using branching, merging, and staging.

### CI/CD and Tools

- The GitHub Actions pipeline is triggered automatically on pushes or pull requests to `main` or `master`.
- **SonarQube**: Requires setting `SONAR_TOKEN` in GitHub Secrets and configuring `sonar.organization` in `sonar-project.properties`.
- **OPA**: Validates `config/deployment.json` against `policies/infrastructure.rego` automatically during the CI/CD pipeline.
