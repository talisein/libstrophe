#!/bin/bash

# for git users
[ -d .git ] && [ ! -d expat/.git ] && git submodule init . && git submodule update

aclocal
libtoolize
automake --add-missing --foreign --copy
autoconf
