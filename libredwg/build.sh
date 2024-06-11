#!/bin/sh

cd /opt/libredwg-0.13.3/
./configure --disable-werror
make
make install
