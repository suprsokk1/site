##
# @site
#
#

all:
	ansible-playbook -ilocalhost, --check site.yml
	ansible-playbook -ilocalhost, site.yml

# end
