# Linux Security Auditor 🔐

> **Enterprise-Grade Linux Security Auditing & Hardening Toolkit**  
> Bash + Python tools for system hardening, auditing weak configurations, detecting suspicious logs, analyzing open ports, and generating automated remediation reports.

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-5.0+-ff69b4.svg)](https://www.gnu.org/software/bash/)
[![Python](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/)
[![Shell](https://img.shields.io/badge/Shell-43.7%25-ff69b4.svg)](#-tech-stack)
[![Docker](https://img.shields.io/badge/docker-supported-blue.svg)](#-deployment)

---

## 📋 Overview

**Linux Security Auditor** is a comprehensive security auditing suite engineered for **DevSecOps engineers**, **sysadmins**, and **security professionals** who need enterprise-grade security automation on resource-constrained hardware.

This toolkit transforms manual security verification into automated, repeatable checks—delivering actionable insights with minimal overhead.

### Core Capabilities

- 🔍 **Audit** system configurations for security weaknesses
- 🛡️ **Harden** Linux systems against common vulnerabilities  
- 📊 **Analyze** suspicious logs and detect anomalies
- 🔌 **Scan** open ports and identify attack vectors
- 📄 **Generate** detailed remediation reports with fix commands
- 💻 **Run efficiently** on minimal resources (tested on Class 12 hardware)

---

## ⚡ Tech Stack

### Core Technologies

| Component | Usage | Percentage |
|-----------|-------|-----------|
| **Bash** | System auditing, orchestration, native utilities | 43.7% |
| **Python** | Log analysis, report generation, data processing | 36.4% |
| **HTML** | Report templates, executive dashboards | 13.4% |
| **Makefile** | Build automation, CI/CD integration | 3.9% |
| **Docker** | Container deployment, reproducible environments | 2.6% |

### Dependencies

```bash
# Python Runtime
- Python 3.6+ (core language)
- Jinja2 (HTML templating)
- PyYAML (config parsing)
- weasyprint (PDF generation)

# System Tools
- Bash 5.0+ (orchestration)
- nmap (advanced port scanning)
- ss/netstat (network analysis)
- auditd (enhanced logging)
- openssl (certificate checks)
- find/grep/awk/sed (log processing)
```

---

## ✨ Key Features

### 🔐 Security Auditing
- **Configuration Analysis** — SSH settings, firewall rules, user permissions
- **Weakness Detection** — Misconfigurations, weak policies, unnecessary services
- **Compliance Checking** — CIS Benchmark, HIPAA, PCI-DSS alignment

### 📋 Log Analysis
- **Suspicious Activity Detection** — syslog, auth.log, application logs
- **Anomaly Recognition** — Failed login patterns, unauthorized access, timeline reconstruction
- **Real-time Monitoring** — Failed login tracking, IP reputation analysis

### 🌐 Port & Network Analysis
- **Open Port Enumeration** — Comprehensive service discovery with nmap fallback
- **Service Profiling** — Version detection, risk assessment
- **Network Exposure Mapping** — Attack surface analysis, vulnerable service identification

### 📑 Automated Report Generation
- **HTML Reports** — Executive summaries with severity ratings
- **Remediation Guidance** — Step-by-step fix commands for each finding
- **Risk Scoring** — Quantitative security posture metrics
- **PDF Export** — Professional documentation (via weasyprint)

### ⚙️ Performance Optimized
- **Minimal Dependencies** — Bash-first architecture reduces bloat
- **Resource Efficient** — Runs on embedded systems, VMs, containers
- **Parallel Execution** — Optional concurrent module execution
- **Smart Caching** — Avoid redundant checks

---

## 🚀 Quick Start

### Prerequisites

```bash
# Required
Bash 5.0+
Python 3.6+
Linux/Unix OS (Ubuntu, Debian, CentOS, Alpine, Rocky, etc.)

# Optional (recommended)
nmap       # Advanced port scanning
auditd     # Enhanced system auditing
openssl    # Certificate analysis
jq         # JSON processing (already included)
```

### Installation

```bash
# Clone repository
git clone https://github.com/boikzdev/linux-security-auditor.git
cd linux-security-auditor

# Make scripts executable
chmod +x scripts/*.sh

# Install Python dependencies
pip install -r requirements.txt
```

### Basic Usage

```bash
# Full security audit
./scripts/audit.sh --all

# Targeted audits
./scripts/audit.sh --config          # Configuration analysis only
./scripts/audit.sh --logs            # Log analysis only
./scripts/audit.sh --ports           # Port scanning only
./scripts/audit.sh --users           # User/permission audit only

# Generate remediation report
python3 python/report_generator.py --audit-results audit_results.json --output report.html

# Verbose output for debugging
./scripts/audit.sh --all -v

# Custom output path
./scripts/audit.sh --all --output custom_results.json
```

---

## 📁 Project Architecture

```
linux-security-auditor/
│
├── 📄 README.md                      # This file
├── 📜 LICENSE                        # MIT License
├── 📋 requirements.txt               # Python dependencies
├── Makefile                          # Build targets
├── Dockerfile                        # Container image
│
├── scripts/                          # Bash modules (43.7% of codebase)
│   ├── audit.sh                      # Orchestrator & entry point
│   ├── config_audit.sh               # SSH, firewall, permissions checks
│   ├── log_analysis.sh               # Failed logins, anomalies
│   ├── port_scanner.sh               # Port enumeration (nmap/ss)
│   └── hardening.sh                  # Remediation recommendations
│
├── python/                           # Python modules (36.4% of codebase)
│   ├── report_generator.py           # HTML/PDF report creation
│   ├── log_parser.py                 # Advanced log parsing
│   └── analyzer.py                   # Anomaly detection, scoring
│
├── configs/                          # Configuration files
│   ├── security_standards.yaml       # Audit baselines (CIS, etc.)
│   └── audit_profiles.yaml           # Custom configurations
│
├── templates/                        # HTML/CSS templates (13.4% of codebase)
│   └── report_template.html          # Report layout & styling
│
├── docs/                             # Documentation
│   ├── USAGE.md                      # Detailed command reference
│   ├── HARDENING.md                  # Step-by-step procedures
│   └── TROUBLESHOOTING.md            # FAQ & common issues
│
├── tests/                            # Unit tests
│   ├── test_analyzer.py              # Analyzer tests
│   └── test_parser.py                # Parser tests
│
└── .github/
    └── workflows/
        └── security-audit.yml        # CI/CD pipeline
```

---

## 🔧 Usage Examples

### Example 1: Complete Security Audit with Report

```bash
# Run full audit
./scripts/audit.sh --all --output /tmp/audit_$(date +%Y%m%d_%H%M%S).json

# Generate HTML report
python3 python/report_generator.py \
  --audit-results /tmp/audit_*.json \
  --output /tmp/security_report.html

# View report in browser
open /tmp/security_report.html
```

### Example 2: Scheduled Daily Compliance Checks

```bash
# Add to crontab for daily 2 AM audits
0 2 * * * /path/to/linux-security-auditor/scripts/audit.sh \
  --all \
  --output /var/log/security-audit/$(date +\%Y\%m\%d).json

# Weekly report compilation
0 6 * * 0 python3 /path/to/python/report_generator.py \
  --audit-results /var/log/security-audit/*.json \
  --output /var/log/security-audit/weekly_report_$(date +\%Y\%m\%d).html
```

### Example 3: CI/CD Pipeline Integration

```yaml
# .github/workflows/security-gate.yml
name: Security Gate
on: [push, pull_request]
jobs:
  security-audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run Security Audit
        run: |
          bash scripts/config_audit.sh || exit 1
          bash scripts/port_scanner.sh || exit 1
          python3 python/report_generator.py --ci-mode
```

### Example 4: Docker Deployment

```bash
# Build container
docker build -t linux-security-auditor:latest .

# Run audit in isolated environment
docker run --rm \
  -v /etc:/etc:ro \
  -v /var/log:/var/log:ro \
  linux-security-auditor:latest

# Run with custom output volume
docker run --rm \
  -v /etc:/etc:ro \
  -v /var/log:/var/log:ro \
  -v $(pwd)/reports:/reports \
  linux-security-auditor:latest --output /reports/audit.json
```

### Example 5: System Hardening with Verification

```bash
# Get recommendations
./scripts/hardening.sh

# Apply hardening (requires root)
sudo ./scripts/hardening.sh --apply

# Verify fixes with re-audit
./scripts/audit.sh --all --output /tmp/post_hardening.json

# Compare reports
diff /tmp/before.json /tmp/post_hardening.json
```

---

## 📊 Comprehensive Audit Capabilities

| Category | Checks | Output Format |
|----------|--------|---|
| **System Hardening** | Kernel patches, SELinux/AppArmor status, firewall rules | Severity, findings, fixes |
| **User & Permissions** | Root access, sudo config, file permissions, password policy | Violations, recommendations |
| **SSH Security** | Port settings, key-based auth, root login, weak ciphers | Findings, hardening steps |
| **Service Management** | Running services, auto-start settings, unnecessary daemons | Risk assessment, disable commands |
| **Network Security** | Open ports, listening services, unusual connections | Port inventory, risk ratings |
| **Log Analysis** | Failed logins, sudo usage, errors, intrusion signatures | Anomalies, timeline, IP stats |
| **File Integrity** | Permissions, ownership, SUID/SGID bits, world-writable files | Violations, remediation steps |

---

## 🎯 Real-World Use Cases

✅ **DevSecOps CI/CD** — Automated security gates in deployment pipelines  
✅ **Compliance & Audits** — CIS Benchmark, HIPAA, PCI-DSS verification  
✅ **Incident Response** — Rapid log analysis & threat timeline reconstruction  
✅ **Cloud Security** — Container & VM hardening for AWS, Azure, GCP  
✅ **Post-Deployment Hardening** — Verify security configuration after deployment  
✅ **Vulnerability Assessment** — Identify and prioritize security gaps  
✅ **Security Training** — Learn Linux security best practices hands-on  
✅ **Compliance Reporting** — Generate audit trails for regulators  

---

## 💡 Best Practices

### Before Running Audits
- [ ] Backup critical configurations
- [ ] Ensure necessary permissions (some checks require root/sudo)
- [ ] Test in non-production environment first
- [ ] Review audit scope to avoid sensitive systems
- [ ] Document baseline results for comparison

### Interpreting Severity Levels
| Level | Urgency | Action |
|-------|---------|--------|
| 🔴 **CRITICAL** | Immediate | Remediate within hours |
| 🟠 **HIGH** | Urgent | Address within 1-2 weeks |
| 🟡 **MEDIUM** | Important | Schedule in next sprint |
| 🟢 **LOW** | Monitor | Document and track |

### Remediation Workflow
1. **Review** audit report for your environment
2. **Validate** findings in test environment first
3. **Implement** recommended fixes
4. **Re-audit** to verify remediation
5. **Document** changes for compliance records

---

## 🔐 Security Considerations

⚠️ **Elevated Privileges**: Some features require root/sudo access. Review all scripts before execution.

⚠️ **Report Sensitivity**: Audit reports contain sensitive system information—secure appropriately (encryption, access control).

⚠️ **Testing First**: Always test in non-production environments before production deployment.

⚠️ **Antivirus Compatibility**: Disable real-time scanning on audit scripts to avoid performance issues.

---

## 🛠️ Build & Development

### Using Make Commands

```bash
# Install dependencies
make install

# Run full audit
make audit

# Generate report
make report

# Run tests
make test

# Build Docker image
make docker
```

### Running Tests

```bash
# Run all tests
pytest tests/

# Specific test file
pytest tests/test_analyzer.py -v

# With coverage
pytest --cov=python tests/
```

---

## 📚 Documentation

- **[Usage Guide](docs/USAGE.md)** — Comprehensive command reference and workflows
- **[Hardening Guide](docs/HARDENING.md)** — Step-by-step hardening procedures
- **[Troubleshooting](docs/TROUBLESHOOTING.md)** — FAQ and common issues
- **[Security Standards](configs/security_standards.yaml)** — Baseline configurations

---

## 🤝 Contributing

Contributions welcome! Focus areas:

- 🔍 Additional security checks and audit modules
- 📊 Enhanced report templates and visualizations
- 🐧 Support for additional Linux distributions
- ⚡ Performance optimizations
- 🌍 Language translations

**Please open issues for bugs or feature requests.**

---

## 📄 License

MIT License — Free to use, modify, and distribute for personal and commercial projects.  
See [LICENSE](LICENSE) file for details.

---

## 🚀 Performance & Compatibility

### Tested Environments
- ✅ Ubuntu 20.04 / 22.04 / 24.04
- ✅ Debian 11 / 12
- ✅ CentOS 7 / 8 / Stream
- ✅ Alpine Linux
- ✅ Rocky Linux
- ✅ ARM64/ARMv7 (Raspberry Pi)

### Resource Requirements
- **Disk**: ~26 MB (minimal footprint)
- **RAM**: 64 MB minimum (no bloat)
- **CPU**: Single-core compatible
- **Bandwidth**: Offline capable

---

## 🆘 Support & Issues

Having problems?

1. **Check** [Troubleshooting Guide](docs/TROUBLESHOOTING.md)
2. **Search** [existing issues](https://github.com/boikzdev/linux-security-auditor/issues)
3. **Open** [new issue](https://github.com/boikzdev/linux-security-auditor/issues/new) with:
   - OS version & architecture
   - Bash/Python versions
   - Error output (full stack trace)
   - Reproduction steps

---

## 🎓 About This Project

Built by a security-focused engineer passionate about making enterprise-grade security auditing **practical, accessible, and automated**—even on resource-constrained hardware.

This toolkit bridges the gap between manual compliance checks and expensive enterprise solutions, proving that effective security doesn't require massive infrastructure or budgets.

**Making Linux security auditing practical for everyone.** 🔐

---

<div align="center">

**⭐ If this project helps you, please consider giving it a star! ⭐**

---

[📖 Usage Guide](docs/USAGE.md) • [🐛 Report Issue](https://github.com/boikzdev/linux-security-auditor/issues) • [✨ Request Feature](https://github.com/boikzdev/linux-security-auditor/issues/new) • [🔒 Security Report](https://github.com/boikzdev/linux-security-auditor/security)

</div>
