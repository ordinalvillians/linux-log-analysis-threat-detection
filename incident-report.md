# Linux Authentication Log Analysis Report

## 1. Project Overview

This project demonstrates basic Linux authentication log analysis using a simulated SSH authentication log and a Bash analysis script.

The objective was to identify repeated failed login attempts, summarize authentication activity, group events by source IP and targeted account, and apply a simple threshold based detection rule.

**Data source:** Simulated lab data, not live system logs.

## 2. Summary of Findings

The sample contains 18 log entries.

- Failed authentication events: 12
- Successful authentication events: 3
- Session opened entries: 3

The successful authentication events were associated with the account `sean` and source IP `192.168.217.1`.

## 3. Failed Login Analysis

Failed attempts were grouped by source IP.

| Source IP | Failed attempts |
|---|---:|
| 198.51.100.42 | 5 |
| 10.10.10.25 | 4 |
| 203.0.113.55 | 3 |

The most frequent source in this dataset was `198.51.100.42`, with five failed attempts.

The targeted account totals were:

| Account | Failed attempts |
|---|---:|
| root | 5 |
| admin | 3 |
| test | 2 |
| guest | 2 |

These results show repeated attempts against several account names, including the privileged `root` account.

## 4. Detection Rule

The script flags source IP addresses with five or more failed authentication attempts.

Under this lab rule, `198.51.100.42` was flagged for review because it reached the threshold of five failed attempts.

This is a simple demonstration rule, not a universal security standard. Repeated failures can have several explanations and do not independently prove malicious activity.

## 5. Recommended Investigation Steps

In a real environment, an analyst should:

1. Review authentication events before and after the flagged activity.
2. Check whether any failed attempts were followed by an unexpected successful login.
3. Confirm whether the source IP and targeted accounts are expected.
4. Correlate the findings with other system and network logs.
5. Escalate or block activity only when supported by the organisation's incident response process.

## 6. Limitations

The dataset is simulated and does not establish that a real system was attacked or compromised.

The threshold is intentionally simple. It does not account for time windows, user behaviour, network context, or other detection signals.

The script is intended for learning and demonstration, not as a replacement for a production security monitoring system.

## 7. Conclusion

The lab demonstrates how Bash can automate basic authentication log summaries and highlight repeated failed login attempts for further investigation.

It also demonstrates the importance of separating a detection signal from a confirmed security incident.
