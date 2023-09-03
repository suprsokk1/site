#!/usr/bin/env sh
REGEX_CIDR='(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}'
{
cat <<EOF
{"foo": "bar"}
EOF
} | jq --slurp --compact-output


exit
