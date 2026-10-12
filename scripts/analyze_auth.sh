

#!/bin/bash

# Linux Authentication Log Analysis
# Input: simulated authentication log supplied as an argument

set -u

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <auth-log-file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ] || [ ! -r "$LOG_FILE" ]; then
    echo "Error: file does not exist or is not readable: $LOG_FILE"
    exit 1
fi

echo "===================================="
echo " Linux Authentication Log Analysis"
echo "===================================="
echo "Log file: $LOG_FILE"
echo "Dataset: Simulated lab data; not live system logs"
echo "Total log entries: $(wc -l < "$LOG_FILE")"
echo "Failed authentication events: $(grep -c 'Failed password' "$LOG_FILE" || true)"
echo "Successful authentication events: $(grep -c 'Accepted password' "$LOG_FILE" || true)"

echo
echo "Failed attempts by source IP:"
awk '/Failed password/ {
    for (i = 1; i <= NF; i++) {
        if ($i == "from") {
            print $(i + 1)
            break
        }
    }
}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo
echo "Failed attempts by targeted account:"
awk '/Failed password/ {
    for (i = 1; i <= NF; i++) {
        if ($i == "for") {
            if ($(i + 1) == "invalid" && $(i + 2) == "user") {
                print $(i + 3)
            } else {
                print $(i + 1)
            }
            break
        }
    }
}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo
echo "Successful authentications by source IP:"
awk '/Accepted password/ {
    for (i = 1; i <= NF; i++) {
        if ($i == "from") {
            print $(i + 1)
            break
        }
    }
}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo
echo "Detection rule: Flag source IPs with 5 or more failed attempts"
echo "Flagged sources (review required):"

awk '/Failed password/ {
    for (i = 1; i <= NF; i++) {
        if ($i == "from") {
            print $(i + 1)
            break
        }
    }
}' "$LOG_FILE" | sort | uniq -c | awk '$1 >= 5 {
    printf "REVIEW: %s failed attempts from %s\n", $1, $2
    found = 1
}
END {
    if (!found) {
        print "No source IP met the threshold."
    }
}'

echo
echo "Analysis complete. Flags indicate patterns for review, not proof of an attack."
