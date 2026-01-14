@echo off
REM tSQLt Test Runner - Windows wrapper
REM Automatically runs the Windows x64 binary

SET SCRIPT_DIR=%~dp0
SET BINARY=%SCRIPT_DIR%bin\win-x64\tSQLtRunner.exe

if not exist "%BINARY%" (
    echo Error: Binary not found at %BINARY%
    exit /b 1
)

REM Pass all arguments to the binary
"%BINARY%" %*
