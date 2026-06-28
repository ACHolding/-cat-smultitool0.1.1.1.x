@echo off
title AC's AIO Multitoolkit 0.1a
color 0a

:menu
cls
echo ==================================================
echo             AC's AIO MULTITOOLKIT 0.1a
echo        All-In-One Utility by Justin (AC Software)
echo ==================================================
echo.
echo  [1] System Info
echo  [2] Network Info
echo  [3] Ping Test
echo  [4] DNS Lookup
echo  [5] Port Scanner (Pure Batch)
echo  [6] Wi-Fi Profiles
echo  [7] Clear Screen
echo  [0] Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto netinfo
if "%choice%"=="3" goto pingtest
if "%choice%"=="4" goto dnslookup
if "%choice%"=="5" goto portscan
if "%choice%"=="6" goto wifilist
if "%choice%"=="7" cls & goto menu
if "%choice%"=="0" exit
goto menu

:sysinfo
cls
echo ==================================================
echo                    SYSTEM INFO
echo ==================================================
echo Hostname: %COMPUTERNAME%
echo Username: %USERNAME%
echo OS: %OS%
echo Processor: %PROCESSOR_IDENTIFIER%
echo Architecture: %PROCESSOR_ARCHITECTURE%
echo.
pause
goto menu

:netinfo
cls
echo ==================================================
echo                  NETWORK INFORMATION
echo ==================================================
ipconfig
echo.
pause
goto menu

:pingtest
cls
echo ==================================================
echo                     PING TEST
echo ==================================================
set /p target=Enter host/IP to ping: 
echo.
ping %target%
echo.
pause
goto menu

:dnslookup
cls
echo ==================================================
echo                     DNS LOOKUP
echo ==================================================
set /p host=Enter domain to lookup: 
echo.
nslookup %host%
echo.
pause
goto menu

:portscan
cls
echo ==================================================
echo                   PORT SCANNER
echo        Pure Batch TCP Handshake Simulation
echo ==================================================
set /p target=Enter target IP/host: 
set /p start=Start port: 
set /p end=End port: 
echo.
echo Scanning %target% from %start% to %end% ...
echo.

for /l %%p in (%start%,1,%end%) do (
    echo Checking port %%p...
    >nul 2>&1 (
        echo open > \\%target%\pipe\%%p
    )
    if errorlevel 1 (
        echo Port %%p: CLOSED
    ) else (
        echo Port %%p: OPEN
    )
)

echo.
pause
goto menu

:wifilist
cls
echo ==================================================
echo                   WI-FI PROFILES
echo ==================================================
netsh wlan show profiles
echo.
pause
goto menu
