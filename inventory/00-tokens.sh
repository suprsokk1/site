#!/usr/bin/env bash
REGEX_CIDR='(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}'

gronify() {
    sed -E 's|[,":]||g;s#true|false##g;s|.*|json._meta.hostvars.localhost.\0 = true\;|'
}

cidr() {
    ip -4 -json route show |
        grep -oP -- "$REGEX_CIDR"'[^"]+' |
        sed -E 's|\.|_|g;s|/|__|;s|.*|"cidr_\0": true,|'
}

static() {
    sed -E '/^[#]/d' <<'GRON'
json = {};
json._meta = {};
json._meta.hostvars = {};
json._meta.hostvars.localhost = {};
json._meta.groupvars.all = {};
json._meta.groupvars = {};
json._meta.groupvars.local = {};
json.all = {};
json.all.children = [];
json.all.children[0] = "ungrouped";
json.all.children[1] = "local";
GRON

}

{
    static
    cidr | gronify
} | gron -u
