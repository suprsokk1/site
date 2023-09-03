#!/usr/bin/env python3
# plugins/vars/external.py -*- mode: python  -*-

import os
import sys
import pathlib
import subprocess

import json
import logging

import concurrent.futures
from concurrent.futures import process
from ansible.plugins.vars import BaseVarsPlugin



class VarsModule(BaseVarsPlugin):
    """TODO."""
    REQUIRES_ENABLED = False

    def get_vars(self, *args):
        return {'foo': gather(*args)}


def run(*cmd, **kwargs):
    proc = subprocess.Popen(
        *(' '.join(cmd) if kwargs.get('shell') else cmd),
        **dict(
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        ),
        **kwargs
    )
    return proc


def override(func):
    def _override(*args, **kwargs):
        data = {}
        git_work_tree = "{HOME}/git/site".format(**os.environ)
        for script in pathlib.Path(f"{git_work_tree}/tmp/script").glob("*"):
            # if os.
            # res = p.communicate()
            pass
        # ret = func(*args, **kwargs)
        return ret
    return _override


# @override
def gather(*args):
    data = {}
    git_work_tree = "{HOME}/git/site".format(**os.environ)
    p = run(f"{git_work_tree}/tmp/script/gather.sh".split())
    res = p.communicate()

    # '/tmp/gather.sh'
    mod, path, hosts = args
    data = res[0].decode('utf8')
    data = json.loads(data)

    if data:
        print(data)

    return data
    return json.dumps(data)
