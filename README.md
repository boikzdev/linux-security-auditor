# Linux Security Auditor 🔐

> **Practical Linux Security Auditing & Hardening Toolkit**  
> Bash + Python tools for system hardening, auditing weak configurations, detecting suspicious logs, analyzing open ports, and generating automated remediation reports.

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-5.0+-green.svg)](https://www.gnu.org/software/bash/)
[![Python](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/)

---

## 📋 Overview

**Linux Security Auditor** is a comprehensive security auditing suite designed for DevSecOps engineers, sysadmins, and security professionals who need to:

- 🔍 **Audit** system configurations for security weaknesses
- 🛡️ **Harden** Linux systems against common vulnerabilities
- 📊 **Analyze** suspicious logs and detect anomalies
- 🔌 **Scan** open ports and identify potential attack vectors
- 📄 **Generate** detailed remediation reports with actionable insights
- 💻 **Run efficiently** on resource-constrained hardware

Built from practical, real-world Linux security best practices optimized for cloud environments and edge deployments.

---

## ✨ Key Features

### Security Auditing
- **Configuration Analysis**: Audit system configs, user permissions, SSH settings, firewall rules
- **Weakness Detection**: Identify misconfigurations, weak passwords policies, unnecessary services
- **Compliance Checking**: Verify alignment with security hardening standards

### Log Analysis
- **Suspicious Activity Detection**: Parse syslog, auth logs, and application logs
- **Anomaly Recognition**: Identify unusual patterns, failed logins, unauthorized access attempts
- **Timeline Reconstruction**: Build security incident timelines

### Port & Network Analysis
- **Open Port Scanning**: Comprehensive port enumeration and service detection
- **Service Profiling**: Identify running services and their security posture
- **Network Risk Assessment**: Evaluate exposure and attack surface

### Report Generation
- **Automated Reports**: Generate detailed HTML/PDF remediation reports
- **Executive Summaries**: High-level security posture overview
- **Actionable Recommendations**: Step-by-step remediation guidance with commands

### Performance Optimized
- Lightweight & efficient on minimal resources
- Bash-first architecture for system-level operations
- Python for advanced data processing and reporting

---

## 🚀 Quick Start

### Prerequisites
```bash
# Required
- Bash 5.0+
- Python 3.6+
- Linux/Unix-based OS (Ubuntu, Debian, CentOS, Alpine, etc.)

# Optional (for full functionality)
- nmap (for port scanning)
- auditd (for enhanced logging)
- openssl (for certificate analysis)
```

### Installation

```bash
# Clone the repository
git clone https://github.com/boikzdev/linux-security-auditor.git
cd linux-security-auditor

# Make scripts executable
chmod +x *.sh
chmod +x scripts/*.sh

# (Optional) Install Python dependencies
pip install -r requirements.txt
```

### Basic Usage

```bash
# Run full security audit
./audit.sh

# Audit specific area
./audit.sh --config        # Configuration audit only
./audit.sh --logs          # Log analysis only
./audit.sh --ports         # Port scan only
./audit.sh --users         # User & permission audit

# Generate remediation report
python3 report_generator.py --audit-results results.json --output report.html

# Verbose output for debugging
./audit.sh -v
```

---

## 📁 Project Structure

```
linux-security-auditor/
├── README.md                    # This file
├── LICENSE                      # MIT License
├── requirements.txt             # Python dependencies
│
├── scripts/
│   ├── audit.sh                # Main audit orchestrator
│   ├── config_audit.sh         # Configuration analysis
│   ├── log_analysis.sh         # Suspicious log detection
│   ├── port_scanner.sh         # Network port enumeration
│   └── hardening.sh            # System hardening recommendations
│
├── python/
│   ├── report_generator.py     # HTML/PDF report creation
│   ├── log_parser.py           # Advanced log parsing
│   └── analyzer.py             # Data analysis & anomaly detection
│
├── configs/
│   ├── security_standards.yaml # Security baselines
│   └── audit_profiles.yaml     # Custom audit configurations
│
├── templates/
│   └── report_template.html    # Report HTML template
│
├──  docs/
│   ├── USAGE.md                # Detailed usage guide
│   ├── HARDENING.md            # Hardening procedures
│   └── TROUBLESHOOTING.md      # FAQ & troubleshooting
├── configs/
│   ├── security_standards.yaml
│   └── audit_profiles.yaml
│
├── templates/
│   └── report_template.html
│
├── .github/
│   └── workflows/
│      └── security-audit.yml
│
├── Dockerfile
│
├── tests/
│   ├── test_analyzer.py
│   └── test_parser.py
│
├── Makefile

```

---

## 🔧 Usage Examples

### Scenario 1: Complete Security Audit
```bash
# Run comprehensive audit with verbose output
./audit.sh -v --all

# Generate detailed remediation report
python3 python/report_generator.py --full-report --output security_audit_$(date +%Y%m%d).html
```

### Scenario 2: Ongoing Compliance Monitoring
```bash
# Schedule daily audits
0 2 * * * /path/to/linux-security-auditor/audit.sh --output /var/log/audit/$(date +\%Y\%m\%d).json

# Weekly report generation
0 6 * * 0 python3 /path/to/python/report_generator.py --weekly
```

### Scenario 3: CI/CD Pipeline Integration
```bash
# Use in deployment pipeline
./scripts/config_audit.sh || exit 1
./scripts/port_scanner.sh || exit 1
python3 python/report_generator.py --ci-mode
```

### Scenario 4: System Hardening
```bash
# Get hardening recommendations
./scripts/hardening.sh

# Apply recommended hardening
sudo ./scripts/hardening.sh --apply
```

---

## 📊 Audit Capabilities

| Category | Checks | Output |
|----------|--------|--------|
| **System** | Kernel patches, SELinux/AppArmor, Firewall rules | Status, Severity, Fix |
| **Users & Permissions** | Root access, Sudo config, File permissions, Password policy | Violations, Recommendations |
| **SSH Security** | Port, key-based auth, root login, weak ciphers | Findings, Hardening steps |
| **Services** | Running services, auto-start, unnecessary daemons | Risk assessment, Disable commands |
| **Network** | Open ports, listening services, unusual connections | Port inventory, Risks |
| **Logs** | Failed logins, sudo usage, errors, intrusion signs | Anomalies, Timeline, Alerts |
| **File Integrity** | Permissions, ownership, SUID/SGID, world-writable | Violations, Fixes |

---

## 🎯 Real-World Use Cases

✅ **DevSecOps CI/CD Integration** — Automated security gates in deployment pipelines  
✅ **Compliance & Audits** — CIS Benchmark, HIPAA, PCI-DSS compliance verification  
✅ **Incident Response** — Rapid log analysis and threat timeline reconstruction  
✅ **Cloud Security** — Container & VM hardening for AWS, Azure, GCP  
✅ **System Hardening** — Post-deployment security configuration  
✅ **Vulnerability Assessment** — Identify and prioritize security gaps  
✅ **Security Training** — Learn Linux security best practices hands-on  

---

## 💡 Best Practices

### Before Running Audits
- [ ] Backup critical configurations
- [ ] Ensure you have necessary permissions (some checks require root)
- [ ] Review audit scope to avoid sensitive environments
- [ ] Document baseline results for comparison

### Interpreting Results
- **Critical (🔴)**: Immediate remediation required
- **High (🟠)**: Address within 1-2 weeks
- **Medium (🟡)**: Plan remediation in next sprint
- **Low (🟢)**: Document and monitor

### Remediation Workflow
1. Review audit report for your environment
2. Validate findings in test environment first
3. Follow recommended remediation steps
4. Re-run audit to verify fixes
5. Document changes for compliance records

---

## 🔐 Security Notes

⚠️ **Permissions**: Some features require root/sudo access. Review scripts before running with elevated privileges.

⚠️ **Data Sensitivity**: Audit reports may contain sensitive system information. Secure appropriately.

⚠️ **Testing**: Always test in non-production environments first.

---

## 🤝 Contributing

Contributions are welcome! Areas for enhancement:

- Additional security checks and audit modules
- Enhanced report templates and visualizations
- Support for additional Linux distributions
- Performance optimizations
- Language translations

Please open issues for bugs or feature requests.

---

## 📚 Documentation

- **[Usage Guide](docs/USAGE.md)** — Detailed command reference and workflows
- **[Hardening Guide](docs/HARDENING.md)** — Step-by-step hardening procedures
- **[Troubleshooting](docs/TROUBLESHOOTING.md)** — FAQ and common issues
- **[Security Standards](configs/security_standards.yaml)** — Audit baselines

---

## 📄 License

This project is licensed under the **MIT License** — see [LICENSE](LICENSE) file for details.

Free to use, modify, and distribute for personal and commercial projects.

---

## 🙋 Support

Having issues? Check our [Troubleshooting Guide](docs/TROUBLESHOOTING.md) or open a [GitHub Issue](https://github.com/boikzdev/linux-security-auditor/issues).

---

## 🎓 About

Built by a passionate security engineer with a focus on practical, real-world security solutions that work on resource-constrained hardware. Designed to make enterprise-grade security auditing accessible to everyone — from sysadmins to DevOps teams.

**Making Linux security auditing practical, accessible, and automated.** 🔐

---

<div align="center">

**⭐ If this project helps you, please give it a star! ⭐**

[Report Issue](https://github.com/boikzdev/linux-security-auditor/issues) • [Request Feature](https://github.com/boikzdev/linux-security-auditor/issues/new) • [Security Reports](https://github.com/boikzdev/linux-security-auditor/security)

</div>
