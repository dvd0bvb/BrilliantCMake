#! /usr/bin/bash

BRANCH=$1
BUILD_TYPE=$2

git clone https://github.com/google/googletest.git --branch $BRANCH --depth 1
pushd googletest
mkdir build
pushd build
cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -G "Unix Makefiles"
make 
sudo make install