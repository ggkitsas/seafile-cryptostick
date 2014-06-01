
DEPS=autoconf automake libtool libevent-dev libcurl4-openssl-dev libgtk2.0-dev uuid-dev intltool libsqlite3-dev valac cmake libfuse-dev python-simplejson

PREFIX?=./build
PKG_CONFIG_PATH="$(PREFIX)/lib/pkgconfig:$(PKG_CONFIG_PATH)"
PATH="$(PREFIX)/bin:$(PATH)"
J?=2

setup: install-deps fetch-modules

install-deps:
	sudo apt-get install -y $(DEPS)

fetch-modules:
	git submodule init
	git submodule update

libsearcpc:
	cd libsearcpc && \
	./autogen.sh && \
	./configure --prefix=$(PREFIX) && \ 
	make -j$(J) && \
	make install

ccnet:
	cd ccnet && \
	./autogen.sh && \
	./configure --prefix=$(PREFIX) && \
	make -j$(J) && \
	make install
	
seafile:
	cd seafile && \
	./autogen.sh && \
	./configure --prefix=$(PREFIX) && \
	make -j$(J) && \
	make install

seafile-client:
	cd seafile-client && \
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(PREFIX) . && \
	make -j$(J) && \
	make install

all: libsearcpc ccnet seafile seafile-client


