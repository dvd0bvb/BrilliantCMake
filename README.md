# BrilliantCMake 

[![Multiplatform Tests](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/cmake-multi-platform.yml) [![Asan](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/asan.yml/badge.svg)](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/asan.yml) [![Msan](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/msan.yml/badge.svg)](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/asan.yml) [![Tsan](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/tsan.yml/badge.svg)](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/tsan.yml) 
[![clang-format Check](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/clang-format-check.yml/badge.svg)](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/clang-format-check.yml) [![cmake-format Check](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/cmake-format-check.yml/badge.svg)](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/cmake-format-check.yml) [![clang-tidy Check](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/clang-tidy-check.yml/badge.svg)](https://github.com/dvd0bvb/BrilliantCMake/actions/workflows/clang-tidy-check.yml)
![coverage](./.github/actions/make-coverage-badge/coverage.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [<img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=dvd0bvb&button_colour=deddda&font_colour=000000&font_family=Inter&outline_colour=000000&coffee_colour=FFDD00" height="21px"/>](https://www.buymeacoffee.com/dvd0bvb")
### A CMake project template

Supports building a C++ project as an executable, library binary, or header only library.

A target is added to build a test executable using the Google Test framework. The test target is the name of the project suffixed with "_TEST", eg: MyProject_TEST. Tests are automatically discovered by ctest.

The github workflows directory contains workflows which will build and run tests on ubuntu using g++ and clang++, and on windows using msvc. It also contains asan and tsan workflows which will run on the test executables.

TODO: add use instructions here