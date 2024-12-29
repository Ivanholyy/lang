@echo off
setlocal

set SOURCES=main.c vm.c value.c scanner.c object.c memory.c debug.c compiler.c chunk.c table.c
set OUTPUT=main.exe

where gcc >nul 2>nul
if errorlevel 1 (
    echo GCC is not installed. Please install GCC and add it to your PATH.
    exit /b 1
)

echo Compiling and linking...
gcc %SOURCES% -o %OUTPUT%
if errorlevel 1 (
    echo Compilation failed.
    exit /b 1
)

if exist %OUTPUT% (
    echo Compilation succeeded. Running %OUTPUT%...
    .\%OUTPUT%
) else (
    echo Compilation did not produce an executable.
    exit /b 1
)

endlocal
