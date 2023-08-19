PATH = /usr/bin:/usr/sbin
export PATH

all:
	echo "Usage: make [check|install]"

debug:
	env - PATH=${PATH} ansible-pull -U ${PWD} --tags debug

check:
	env - PATH=${PATH} ansible-pull -U ${PWD} --check

install:
	env - PATH=${PATH} ansible-pull -U ${PWD}
