
setlocal enabledelayedexpansion

set BRANCH=%1
set BUILD_TYPE=%2
set DYNAMIC_RUNTIME=%3

git clone https://github.com/google/googletest.git --branch %BRANCH% --depth 1
pushd googletest
mkdir build
pushd build

echo %DYNAMIC_RUNTIME%
if "%DYNAMIC_RUNTIME%"=="true" (
    set RUNTIME_FLAG=-Dgtest_force_shared_crt=ON
) else (
    set RUNTIME_FLAG=
)
cmake .. -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -G "NMake Makefiles" %RUNTIME_FLAG%
cmake --build . --config %BUILD_TYPE%
cmake --install . --config %BUILD_TYPE%