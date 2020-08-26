@echo off
REM ******************************************************************
REM Version: 26Aug2020
REM Set ZXBasic (compiler) path and Emulator ZEsarUX-9 path
REM ******************************************************************
set ZXB=C:\Users\Bob\Documents\VSC\ZXBasic\zxb\zxbc.exe
set EMULATOR=C:\Users\Bob\Documents\VSC\ZEsarUX-9.0-windows\

REM ******************************************************************
time /T

REM Break the .bas file name, passed as %1, into a path (pname) and filename (fname)
set FILE=%1
for %%I in ("%FILE%") do  (
	set pname=%%~dpI
	set fname=%%~nxI
)

REM *** Compile ***
REM More info on the switches used : https://zxbasic.readthedocs.io/en/latest/zxb/

%ZXB% -t -a -B %1 -o  %pname%%2%.tap

REM *** Run ***
cd %EMULATOR%
zesarux.exe --tape %pname%%2%.tap --machine TBBlue --nosplash --nowelcomemessage 

)
