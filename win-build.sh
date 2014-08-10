#!/bin/bash -ue

# Dependencies (list might be incomplete):
# src/libevent-2.0.21-stable.tar.gz
# src/libsearpc (I used git f022c6509cff2eb604024c003eb60bcda975c0b1)
# src/ccnet (with Nicolas' patches, I used 3495a78466add16cfa9eddfb35a312bb9ce55264)
# src/seafile (with Nicolas' patches, I used 59eb918655dfa5f1328ec72be00681c6192f523d)
#
# Toolchain:
# vala (vala-0.18.1-1.fc18.x86_64)
# mingw32-gcc (mingw32-gcc-4.7.2-7.fc18.x86_64)
# mingw32-pkg-config (mingw32-pkg-config-0.27-1.fc18.x86_64)
# mingw32-glib2 (mingw32-glib2-2.34.3-2.fc18.noarch)
# mingw32-pthreads (mingw32-pthreads-2.8.0-22.20110511cvs.fc18.noarch)
# mingw32-sqlite (mingw32-sqlite-3.7.13-1.fc18.noarch)
# mingw32-openssl (mingw32-openssl-1.0.1e-1.fc18.noarch)

HOST=i686-w64-mingw32
BUILD=x86_64-linux-gnu
TARGET=i686-w64-mingw32

PREFIX=`pwd`

PATCH_DIR=`pwd`/patches

export PATH=$PREFIX/bin:$PATH
export PKG_CONFIG=i686-w64-mingw32-pkg-config
# Not sure adding /usr/... is required. It shouldn't be.
# Same for CPPFLAGS and LDFLAGS. But none of this should do any harm.
export PKG_CONFIG_PATH=/usr/$TARGET/sys-root/mingw/lib/pkgconfig:$PREFIX/lib/pkgconfig
export CPPFLAGS="-I/usr/$TARGET/sys-root/mingw/include -I$PREFIX/include" # -I//usr/include/x86_64-linux-gnu" #-I/usr/include"
export LDFLAGS="-L/usr/$TARGET/sys-root/mingw/lib -L$PREFIX/lib"

export LIBRARY_PATH=$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib

#export SEARPC_CFLAGS="-I$PREFIX/include"
#export SEARPC_LIBS="-L$PREFIX/lib/"

echo "Checking for libevent..."
if ! test -f $PREFIX/include/evutil.h; then
        echo "Building libevent"
        pushd src
        tar xvf libevent-2.0.21-stable.tar.gz
        pushd libevent-2.0.21-stable
        ./configure --host=$HOST --build=$BUILD --target=$TARGET --prefix=$PREFIX

        make
        make install

        popd
        popd
fi

echo "Checking for libsearpc..."
if ! test -f $PREFIX/bin/searpc-codegen.py; then
        echo "Building libsearpc"
        pushd src/libsearpc
        bash autogen.sh
        ./configure --host=$HOST --build=$BUILD --target=$TARGET --prefix=$PREFIX --enable-shared --disable-static

        cp $PATCH_DIR/searpc/configure .

        make
        make install
        popd
fi

echo "Checking for ccnet..."
if ! test -d $PREFIX/include/ccnet; then
        echo "Building ccnet"
        pushd src/ccnet
        bash autogen.sh
        ./configure --host=$HOST --build=$BUILD --target=$TARGET --prefix=$PREFIX --disable-python

        cp $PATCH_DIR/ccnet/configure .
        cp $PATCH_DIR/ccnet/libccnet_utils.c $PATCH_DIR/ccnet/utils.c ./lib/

        make
        make install DESTDIR=$PREFIX
        popd
fi

echo "Checking for seafile..."
if ! test -f $PREFIX/bin/seafile-applet.en.exe; then
        echo "Building seafile"
        pushd src/seafile
        bash autogen.sh
        ./configure --host=$HOST --build=$BUILD --target=$TARGET --prefix=$PREFIX --disable-python
        
        cp $PATCH_DIR/seafile/configure .
        cp $PATCH_DIR/seafile/utils.c ./lib/

        # For gui/win/Makefile
        export CC=$TARGET-gcc
        export RC=$TARGET-windres
        make

        pushd gui/win
        make en
        popd

        make install

        popd

        echo "Copying over seafile-applet.en.exe..."
        cp src/seafile/gui/win/seafile-applet.en.exe $PREFIX/bin/seafile-applet.en.exe
fi

echo
echo "Check out bin/seafile-applet.en.exe"
echo "Some more EXEs and DLLs which might be required to run the applet are in ./bin"
