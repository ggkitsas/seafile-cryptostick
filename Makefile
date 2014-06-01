
DEPS=autoconf automake libtool libevent-dev libcurl4-openssl-dev libgtk2.0-dev uuid-dev intltool libsqlite3-dev valac cmake libfuse-dev python-simplejson


setup: install-deps

install-deps:
	sudo apt-get install -y $(DEPS)



