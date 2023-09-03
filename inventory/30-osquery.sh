#!/usr/bin/env sh
exec 2>/dev/null

osqueryi --json <<EOF
SELECT DISTINCT *
FROM rpm_packages
LIMIT 10;
EOF
