#! /usr/bin/bash

# Ripped from google's documentation
# clone LLVM
git clone --depth=1 https://github.com/llvm/llvm-project
cd llvm-project
mkdir build; cd build
# configure cmake
cmake -GNinja ../llvm \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_ENABLE_PROJECTS="libcxx;libcxxabi" \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DLLVM_USE_SANITIZER=MemoryWithOrigins
# build the libraries
cmake --build . -- cxx cxxabi