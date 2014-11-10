
ROOTDIR= $(shell pwd)
PATCH_DIR=$(ROOTDIR)/patches
DEPS=autoconf automake libtool libcurl4-openssl-dev libevent-dev libgtk2.0-dev uuid-dev intltool libsqlite3-dev valac cmake libfuse-dev python-simplejson libjansson-dev
EXTRA_DEPS= libqt4-dev

J?=2
PREFIX?=$(ROOTDIR)/build
export PKG_CONFIG_PATH "$(PREFIX)/lib/pkgconfig:$(PKG_CONFIG_PATH)"
export PATH "$(PREFIX)/bin:$(PATH)" 

.PHONY: libsearpc ccnet seafile seafile-client

setup: install-deps fetch-modules

install-deps:
	sudo apt-get install -y $(DEPS)
	sudo apt-get install -y $(EXTRA_DEPS)

fetch-modules:
	git submodule init
	git submodule update

libsearpc:
	cd libsearpc && \
	./autogen.sh && \
	./configure --prefix=$(PREFIX) && \
    cp $(PATCH_DIR)/searpc-marshal.h.libsearpc ./demo/searpc-marshal.h && \
	make -j$(J) && \
	make install

ccnet:
	export PKG_CONFIG_PATH="$(PREFIX)/lib/pkgconfig:$(PKG_CONFIG_PATH)" && \
	export PATH="$(PREFIX)/bin:$(PATH)" && \
	cd ccnet && \
	./autogen.sh && \
	./configure --prefix=$(PREFIX) && \
	cp $(PATCH_DIR)/searpc-marshal.h.ccnet ./lib/searpc-marshal.h && \
	make -j$(J) && \
	make install

PCSC_INC=-I/usr/include/PCSC
seafile:
	export PKG_CONFIG_PATH="$(PREFIX)/lib/pkgconfig:$(PKG_CONFIG_PATH)" && \
	export PATH="$(PREFIX)/bin:$(PATH)" && \
	cd seafile && \
	./autogen.sh && \
	./configure --prefix=$(PREFIX) PCSCLITE_CFLAGS=$(PCSC_INC) PCSCLITE_LIBS=-lpcsclite && \
	cp $(PATCH_DIR)/searpc-marshal.h.seafile ./lib/searpc-marshal.h && \
	make -j$(J) && \
	make install

				#-DPCSCLITE_LIBRARY_DIRS=/home/cyc0/Projects/smartcards/pcsc-lite-1.8.11/build/lib 
seafile-client: 
	export PKG_CONFIG_PATH="$(PREFIX)/lib/pkgconfig:$(PKG_CONFIG_PATH)" && \
	export PATH="$(PREFIX)/bin:$(PATH)" && \
	cd seafile-client && \
	cmake -DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX=$(PREFIX) \
			-DPCSCLITE_INCLUDE_DIRS=/usr/include/PCSC \
			. && \
	make VERBOSE=1 -j$(J) && \
	make install

seafile-demo: seafile seafile-client
	tar -zcf build.tar.gz build/ && cp build.tar.gz ~/Documents/gsoc/jan_shared_btsync/seafile-demo

all: libsearpc ccnet seafile seafile-client


