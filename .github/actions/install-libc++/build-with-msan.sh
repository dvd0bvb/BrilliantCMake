#! /usr/bin/bash

# clone LLVM
git clone --depth=1 https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build
# configure cmake
cmake -G "Unix Makefiles" \
	-S runtimes \
	-B build \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DLLVM_USE_SANITIZER=MemoryWithOrigins
# build the libraries
cmake --build . -- cxx cxxabi