@echo off
if "%1"=="retail" goto retail
if "%1"=="debug" goto debug

echo.
echo setupbuild [retail][debug]
exit /b

:retail
echo Setting up environment for RETAIL
call "%PROGRAMFILES%\Microsoft Platform SDK\SetEnv.cmd" /XP32 /RETAIL
set NIDMSDKDIR=C:\work\pismere\athena\auth\krb5\src\windows\identity\obj\i386\rel
goto common

:debug
echo Setting up environment for DEBUG
call "%PROGRAMFILES%\Microsoft Platform SDK\SetEnv.cmd" /XP32 /DEBUG
set NIDMSDKDIR=C:\work\pismere\athena\auth\krb5\src\windows\identity\obj\i386\dbg
goto common

:common
set KFWSDKDIR=c:\work\kfw-3.1.0-sdk
set OPENSSLDIR=c:\work\openssl
set HHCFULLPATH="C:\Program Files\HTML Help Workshop\hhc.exe"
for %%i in (candle.exe) do (
        if "%%~$PATH:i"=="" goto nowix
        echo candle.exe found at : %%~$PATH:i
)
goto headout1
:nowix
set PATH=%PATH%;c:\work\wix2
:headout1
for %%i in (gtags.exe) do (
        if "%%~$PATH:i"=="" goto nogtags
        echo gtags.exe found at : %%~$PATH:i
)
goto headout2
:nogtags
set PATH=%PATH%;c:\work\global\bin
:headout2
for %%i in (runemacs.exe) do (
        if "%%~$PATH:i"=="" goto noemacs
        echo runemacs.exe found at : %%~$PATH:i
)
goto headout3
:noemacs
set PATH=%PATH%;c:\emacs-22.1\bin\
:headout3
title KCA Build
exit /b
