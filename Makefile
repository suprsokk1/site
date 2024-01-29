
PAGER =
COMPOSEFILE = compose.yml:compose-watch.yml
COMPOSE_ARGS = $(foreach i,$(subst :, ,${COMPOSEFILE}),-f ${i})

# target arguments
check_args = --check
install_args =

all: show

show status: config

install check:
	ansible-playbook $(call ${@}_args) _dotfiles.yml

config watch: compose-watch.yml
	docker compose ${COMPOSE_ARGS} $@

clean:
	 rm -v compose-watch.yml

compose-watch.yml:
	./script/docker-compose-watch-helper.sh > $@
	cat $@

.DELETE_ON_ERROR:
.EXPORT_ALL_VARIABLES:
