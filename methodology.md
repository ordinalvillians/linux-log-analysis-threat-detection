# Methodology

## Objective

Analyse a simulated Linux SSH authentication log to identify repeated failed logins, summarize successful authentication activity, and flag sources that meet a defined threshold.

## Tools Used

- Kali Linux
- Bash
- grep for matching authentication events
- awk for extracting fields and summarizing events
- sort and uniq for grouping repeated values
- wc for counting log entries
- tee for saving analysis output

## Procedure

1. Created a simulated authentication log containing failed login attempts, successful authentications, and session events.
2. Counted total log entries and selected authentication event types.
3. Grouped failed login attempts by source IP address.
4. Grouped failed attempts by targeted account.
5. Summarized successful authentications by source IP.
6. Added a detection rule that flags source IPs with five or more failed attempts.
7. Saved the script output as evidence for review.
8. Tested the script's input validation using a missing file and an omitted argument.

## Detection Logic

The script counts failed authentication events for each source IP and flags any source with five or more failures.

The threshold is a configurable lab rule used to demonstrate basic detection logic. A flag indicates that further investigation may be useful; it does not confirm malicious activity.

## Data Handling

The authentication log is simulated lab data, not a capture of live system activity.

Documentation-range and private IP addresses are used in the sample to avoid presenting the exercise as evidence of a real-world attack.

## Limitations

The analysis does not use a time-based threshold, correlate events with external threat intelligence, or validate the identity of any source.

The results should be interpreted within the limits of the supplied sample.
