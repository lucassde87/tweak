@echo off
cls
title DAMONS MOUSE PANEL V2 - DISCORD.GG/DAMONS
:: Check if C:\temp exists, if not, create it
if not exist "C:\temp\" mkdir "C:\temp\"
echo [-] Creating System Restore Point (Damons Mouse Pack V2 Restore Point)
powershell.exe -Command "Checkpoint-Computer -Description 'Damons Mouse Pack V2' -RestorePointType 'MODIFY_SETTINGS'"
echo [-] Making folders in c: drive (its the "damons" folder)
md C:\damons\resources
md C:\damons\PowerPlan
md C:\damons\resources\HIDUSBF
md C:\damons\resources\HIDUSBF\98ME
md C:\damons\resources\HIDUSBF\AMD64
md C:\damons\resources\HIDUSBF\AMD64_AS
md C:\damons\resources\HIDUSBF\NTX86
md C:\damons\resources\HIDUSBF\NTx86_AS
echo [-] Download Resources (Power Plan, HIDUSBF, Text Guide)
curl -g -k -L -# -o "C:\damons\resources\mouseguide.txt" "https://files.catbox.moe/dq5avl.txt"
curl -g -k -L -# -o "C:\damons\Powerplan\damons.pow" "https://files.catbox.moe/2a716s.pow"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\1kHz.cmd" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/bilrd3ne.cmd"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\2kHz-4kHz.cmd" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/dhbkdt2w.cmd"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\4kHz-8kHz.cmd" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/2xgvn6ay.cmd
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\HIDUSBF.inf" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/fif8jcrz.INF"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\HIDUSBF_AS.inf" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/awmklwdc.INF"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\HIDUSBFU.inf" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/rkpx5xtp.INF"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\nopatch.cmd" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/ghc3n5rt.cmd"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\Setup.exe" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/fgcjs4ut.exe"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\sx64.exe" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/4o5cawp8.exe"
curl -g -k -L -# -o "C:\damons\resources\HIDUSBF\98ME\hidusbf.sys" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/55nk6a1n.sys"
cls
mode 120,30
set w=[97m
set p=[95m
set b=[96m
:main
chcp 65001 >nul 2>&1
cls
color 0
echo.
echo.
echo              ██████╗  █████╗ ███╗   ███╗ ██████╗ ███╗   ██╗███████╗        ███╗   ███╗ ██████╗ ██╗   ██╗███████╗███████╗
echo              ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗████╗  ██║██╔════╝        ████╗ ████║██╔═══██╗██║   ██║██╔════╝██╔════╝
echo              ██║  ██║███████║██╔████╔██║██║   ██║██╔██╗ ██║███████╗        ██╔████╔██║██║   ██║██║   ██║███████╗█████╗  
echo              ██║  ██║██╔══██║██║╚██╔╝██║██║   ██║██║╚██╗██║╚════██║        ██║╚██╔╝██║██║   ██║██║   ██║╚════██║██╔══╝  
echo              ██████╔╝██║  ██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████║        ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝███████║███████╗
echo              ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═══╝           ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
                                                                                                                                                                                         
echo                      --------------------------------------------------------------------------------------------                                                                       
echo.
echo.
echo.
echo                          [1] Mouse Acceleration          [2] Extra Tweaks          [3] Mouse Data Queue Size      
echo.
echo.
echo                                           [4] Power Plan                     [5] Polling Rate
echo.
echo.
echo.
echo                                               [D] Discord   [X] Better Tweaks   [Y] YouTube


echo.
echo.
echo.
echo.
set /p choice="Choose an option:"

if "%choice%"=="1" goto acceleration
if "%choice%"=="2" goto extras
if "%choice%"=="3" goto dqsize
if "%choice%"=="4" goto plan
if "%choice%"=="5" goto hidusbf
if "%choice%"=="x" goto web2
if "%choice%"=="d" goto discord1
if "%choice%"=="y" goto youtube1
goto main



:acceleration
cls
start main.cpl
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main




:extras
cls
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendEnabled /t REG_BINARY /d 00 /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "0" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MouseWheelRouting" /t REG_DWORD /d "0" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Mouse" /v "Beep" /t REG_SZ /d "No" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Mouse" /v "ExtendedSounds" /t REG_SZ /d "No" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Sound" /v "Beep" /t REG_SZ /d "no" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Sound" /v "ExtendedSounds" /t REG_SZ /d "no" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "0" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Desktop" /v "MouseWheelRouting" /t REG_DWORD /d "0" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Mouse" /v "Beep" /t REG_SZ /d "No" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Mouse" /v "ExtendedSounds" /t REG_SZ /d "No" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Sound" /v "Beep" /t REG_SZ /d "no" /f 
Reg.exe add "HKU\.DEFAULT\Control Panel\Sound" /v "ExtendedSounds" /t REG_SZ /d "no" /f 
Reg.exe add "HKCU\Control Panel\Mouse" /v "ActiveWindowTracking" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "Beep" /t REG_SZ /d "No" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "DoubleClickHeight" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "DoubleClickSpeed" /t REG_SZ /d "500" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "DoubleClickWidth" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "ExtendedSounds" /t REG_SZ /d "No" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverHeight" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverWidth" /t REG_SZ /d "4" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseTrails" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "0000000000000000c0cc0c0000000000809919000000000040662600000000000033330000000000" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000a800000000000000e00000000000" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SnapToDefaultButton" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "SwapMouseButtons" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorSensitivity" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "IRRemoteNavigationDelta" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "AttractionRectInsetInDIPS" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "DistanceThresholdInDIPS" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismDelayInMilliseconds" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismUpdateIntervalInMilliseconds" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "VelocityInDIPSPerSecond" /t REG_DWORD /d "360" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main




:dqsize
cls
start C:\damons\resources\mouseguide.txt
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f
start regedit.exe
@echo off
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
goto main


:plan
cls
echo.
powercfg -import "C:\damons\Powerplan\damons.pow"
powercfg.cpl
pause
goto main

:hidusbf
cls
start /wait C:\damons\resources\HIDUSBF
start C:\damons\resources\HIDUSBF\Setup.exe
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
goto main