PATH = /usr/bin:/usr/sbin
export PATH

define environ
PATH=${PATH} HOME=${HOME}
endef

define tmux
tmux new-window -c ${PWD} \; send '$(call ${1})' Enter
endef

define ansible-playbook
env - $(call environ) ansible-playbook $(call playbook)
endef

playbook = local.yml
playbook = tmp/test.yml
debug = --tags debug
check = --check
install =

all:
	echo "Usage: make [debug|check|install]"

ansible-playbook: tmux
	$(call $^,$@)

debug check install:
	env - PATH=${PATH} ansible-pull --checkout HEAD --url ${PWD} $(call $@)

.PHONY: all tmux ansible-playbook debug check install
