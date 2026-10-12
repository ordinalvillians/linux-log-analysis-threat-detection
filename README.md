# Linux Log Analysis and Threat Detection Lab

A beginner cybersecurity portfolio project demonstrating Linux authentication log analysis with Bash.

## Project Overview

This lab analyses a simulated SSH authentication log to summarize login activity, identify repeated failed attempts, and flag source IP addresses for further review.

The project demonstrates basic log analysis, command-line text processing, input validation, and threshold-based detection.

**Important:** All authentication events are simulated. This project does not document a real attack or compromise.

## Skills Demonstrated

- Linux command-line operations
- Bash scripting
- Authentication log analysis
- Text processing with `grep`, `awk`, `sort`, `uniq`, and `wc`
- Failed login and account pattern analysis
- Basic threshold-based detection
- Evidence capture and technical documentation

## Project Structure

```text
Day3-Linux-Log-Analysis/
├── logs/
│   └── auth.log
├── scripts/
│   └── analyze_auth.sh
├── evidence/
│   └── analysis-output.txt
├── screenshots/
├── README.md
├── methodology.md
└── incident-report.md
```

## Requirements

- Linux environment
- Bash shell
- Standard command-line utilities: `grep`, `awk`, `sort`, `uniq`, and `wc`

No additional packages are required for the analysis script.

## Run the Analysis

Clone or download this repository, then enter the project directory.

Run the script against the supplied sample log:

```bash
chmod +x scripts/analyze_auth.sh
./scripts/analyze_auth.sh logs/auth.log
```

To save a copy of the output:

```bash
./scripts/analyze_auth.sh logs/auth.log | tee evidence/analysis-output.txt
```

## Detection Rule

The script flags a source IP when it has five or more failed authentication attempts in the supplied log.

This is an educational threshold, not a universal security standard. A flagged source requires investigation; the flag alone does not prove an attack.

## Sample Findings

The simulated dataset contains:

- 18 total log entries
- 12 failed authentication events
- 3 successful authentication events
- 3 session-opened entries

The analysis flags `198.51.100.42` because it has five failed attempts in the sample.

## Testing

The script was tested with the supplied log and with invalid input, including a missing log file and an omitted argument.

## Documentation

- [Methodology](methodology.md)
- [Incident Analysis Report](incident-report.md)

## Limitations

This is a learning project using simulated data. It is not a production monitoring system and does not establish that any real host or account was attacked.

## Author

Cybersecurity portfolio project — Linux log analysis and basic threat detection.
