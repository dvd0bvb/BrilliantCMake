#! /usr/bin/bash

BRANCH=$1
BUILD_TYPE=$2

git clone https://github.com/google/googletest.git --branch $BRANCH --depth 1
pushd googletest
mkdir build
pushd build
if [-z "$3"] 
then
    cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -G "Unix Makefiles"
else
    cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -G "Unix Makefiles" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_FLAGS=$3 -DCMAKE_CXX_FLAGS=$3
fi
make 
sudo make install