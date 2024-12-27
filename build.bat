@echo off
setlocal

REM Set the source files
set SOURCES=main.c vm.c value.c scanner.c object.c memory.c debug.c compiler.c chunk.c table.c
set OUTPUT=main.exe

REM Check if GCC is installed
where gcc >nul 2>nul
if errorlevel 1 (
    echo GCC is not installed. Please install GCC and add it to your PATH.
    exit /b 1
)

REM Compile and link all source files
echo Compiling and linking...
gcc %SOURCES% -o %OUTPUT%
if errorlevel 1 (
    echo Compilation failed.
    exit /b 1
)

REM Check if the executable was created
if exist %OUTPUT% (
    echo Compilation succeeded. Running %OUTPUT%...
    .\%OUTPUT%
) else (
    echo Compilation did not produce an executable.
    exit /b 1
)

endlocal
