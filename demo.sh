#!/bin/sh

tar -xvf build.tar.gz
cd build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`
cd ../bin
export PATH=$PATH:`pwd`
./seafile-applet > log.txt
