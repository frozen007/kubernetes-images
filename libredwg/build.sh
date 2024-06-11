#!/bin/sh

cd /opt/libredwg-0.13.3.7257/
./configure --disable-werror
make
make install
