@echo off
cls
title DAMONS KEYBOARD PANEL V1 - DISCORD.GG/DAMONS
:: Check if C:\temp exists, if not, create it
if not exist "C:\temp\" mkdir "C:\temp\"
echo [-] Creating System Restore Point (Damons KB Pack V1 Restore Point)
powershell.exe -Command "Checkpoint-Computer -Description 'Damons KB Pack V4' -RestorePointType 'MODIFY_SETTINGS'"
echo [-] Making folders in c: drive (its the "damons" folder)
md C:\damons\resources
md C:\damons\PowerPlan
md C:\damons\resources\HIDUSBF
md C:\damons\resources\HIDUSBF\98ME
md C:\damons\resources\HIDUSBF\AMD64
md C:\damons\resources\HIDUSBF\AMD64_AS
md C:\damons\resources\HIDUSBF\NTX86
md C:\damons\resources\HIDUSBF\NTx86_AS
echo [-] Download Resources (HIDUSBF, Text Guide and Power Plan)
curl -g -k -L -# -o "C:\damons\resources\guide.txt" "https://files.catbox.moe/uffvua.txt"
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
curl -g -k -L -# -o "C:\damons\Powerplan\damons.pow" "https://files.catbox.moe/2a716s.pow"
cls
mode 140,30
set w=[97m
set p=[95m
set b=[96m
:main
chcp 65001 >nul 2>&1
cls
color 0
echo.
echo.
echo               ██████╗  █████╗ ███╗   ███╗ ██████╗ ███╗   ██╗███████╗  ██╗  ██╗███████╗██╗   ██╗██████╗  ██████╗  █████╗ ██████╗ ██████╗ 
echo               ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗████╗  ██║██╔════╝  ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗
echo               ██║  ██║███████║██╔████╔██║██║   ██║██╔██╗ ██║███████╗  █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║   ██║███████║██████╔╝██║  ██║
echo               ██║  ██║██╔══██║██║╚██╔╝██║██║   ██║██║╚██╗██║╚════██║  ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║
echo               ██████╔╝██║  ██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████║  ██║  ██╗███████╗   ██║   ██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝
echo               ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═══╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝                                                                                                       
echo                    -----------------------------------------------------------------------------------------------------------------                                                                         
echo.
echo.
echo.
echo                              [1] Disable Sticky Keys          [2] Extra Tweaks          [3] Keyboard Data Queue Size      
echo.
echo.
echo                              [4] Power Plan                   [5] Polling Rate          [6] Selective Suspend
echo.
echo.
echo.
echo                                               [D] Discord   [X] Better Tweaks   [Y] YouTube


echo.
echo.
echo.
echo.
set /p choice="Choose an option:"

if "%choice%"=="1" goto sticky
if "%choice%"=="2" goto extras
if "%choice%"=="3" goto dqsize
if "%choice%"=="4" goto plan
if "%choice%"=="5" goto hidusbf
if "%choice%"=="x" goto web2
if "%choice%"=="d" goto discord1
if "%choice%"=="y" goto youtube1
goto main



:sticky
cls
Reg.exe add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main




:extras
cls
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f 	
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f 	
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f 	
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D1Latency" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D2Latency" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D3Latency" /t REG_DWORD /d "0" /f 
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main




:dqsize
cls
start C:\damons\resources\guide.txt
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters /f
START regedit
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

:Suspend
cls
powercfg -setacvalueindex SCHEME_CURRENT SUB_USB USBSELECTIVESUSPEND 0
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
goto main