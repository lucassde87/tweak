@echo off
cls
title DAMON PROCESS LOWERING V2
:: Check if C:\temp exists, if not, create it
if not exist "C:\temp\" mkdir "C:\temp\"
echo [-] Creating System Restore Point (Damon V2 Restore Point)
echo [-] Making folders in c: drive (its the "damons" folder)
echo [-] Download Resources (MSI Util, Wub, Power Plan)
md C:\damons\resources
curl -g -k -L -# -o "C:\damons\resources\Wub.exe" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/9cllihtz.exe"
curl -g -k -L -# -o "C:\damons\resources\DQ_Guide.txt" "https://github.com/Damonstweaks/data-queue-size-txt/releases/download/text/Data.Queue.Size.Guide.txt"
curl -g -k -L -# -o "C:\damons\resources\MSI_Utility_V3.exe" "https://r2.e-z.host/9e71d386-8c79-465c-9927-36ba4162c8f4/9tlvwpdm.exe"
powershell.exe -Command "Checkpoint-Computer -Description 'Damon V2' -RestorePointType 'MODIFY_SETTINGS'"
cls
set w=[97m
set p=[95m
set b=[96m
:main
chcp 65001 >nul 2>&1
cls
mode 100,32
color 0
echo.
echo.
echo               ██████╗  █████╗ ███╗   ███╗ ██████╗ ███╗   ██╗███████╗    ████████╗██╗    ██╗███████╗ █████╗ ██╗  ██╗
echo               ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗████╗  ██║██╔════╝    ╚══██╔══╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝
echo               ██║  ██║███████║██╔████╔██║██║   ██║██╔██╗ ██║███████╗       ██║   ██║ █╗ ██║█████╗  ███████║█████╔╝
echo               ██║  ██║██╔══██║██║╚██╔╝██║██║   ██║██║╚██╗██║╚════██║       ██║   ██║███╗██║██╔══╝  ██╔══██║██╔═██╗
echo               ██████╔╝██║  ██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████║       ██║   ╚███╔███╔╝███████╗██║  ██║██║  ██╗
echo               ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝       ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ 
echo                          --------------------------------------------------------------------------------                                                                         
echo.
echo                           [1] Windows Settings                   [2] Debloat     
echo.
echo                           [3] CPU Tweaks                         [4] Miscellaneous
echo.
echo                           [5] Clean Temp Files                   [6] Data Queue Size
echo.
echo.
echo.
echo                                    [D] Discord   [X] Better Tweaks   [Y] YouTube
echo.
echo.
echo.
echo.
set /p choice="Choose an option:"

if "%choice%"=="1" goto windows
if "%choice%"=="2" goto debloat
if "%choice%"=="3" goto cpu
if "%choice%"=="4" goto misc
if "%choice%"=="5" goto clean
if "%choice%"=="6" goto dqsize
if "%choice%"=="x" goto web2
if "%choice%"=="d" goto discord1
if "%choice%"=="y" goto youtube1
goto main



:windows
cls
echo.
echo               ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗
echo               ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝
echo               ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗
echo               ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║
echo               ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║
echo                ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝                                                       
echo          -------------------------------------------------------------------
echo.
echo             [1] Settings          [2] Power Plan       [3] Block Updates       
echo.
echo                    [4] Disable Telemtry           [5] IO Tweaks
echo.
echo.
echo                                      [x] Menu
echo.
echo.
set /p choice="Choose an option (1-5, x): "

if "%choice%"=="1" goto wsettings
if "%choice%"=="2" goto plan
if "%choice%"=="3" goto wub
if "%choice%"=="4" goto telemtry
if "%choice%"=="5" goto io
if "%choice%"=="x" goto main
goto tweaks




:telemtry
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MicrosoftEdgeElevationService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\edgeupdate" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\edgeupdatem" /v "Start" /t REG_DWORD /d "4" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\MicrosoftEdgeUpdateTaskMachineCore" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\MicrosoftEdgeUpdateTaskMachineUA" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "StartupBoostEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\GoogleChromeElevationService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdate" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdatem" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "UseDpiScaling" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Multimedia\Audio" /v "User DuckingPreference" /t REG_DWORD /d "3" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" /v "DisableStartupSound" /t REG_DWORD /d "1" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "ctfmon" /t REG_SZ /d "C:\Windows\System32\ctfmon.exe" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\VideoSettings" /v "VideoQualityOnBattery" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f
reg add "HKCU\Control Panel\Desktop" /v "User PreferencesMask" /t REG_EXPAND_SZ /d "ነ考" /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f 
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\safer\codeidentifiers" /v "authenticodeenabled" /t REG_DWORD /d "0" /f 
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f 
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKU\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUser Activities" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUser Activities" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUser Disabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f 
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.
echo Telemtry Sucessfully Disabled
echo ===============================
pause
goto windows

:io
cls
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "PassiveIntRealTimeWorkerPriority" /t REG_DWORD /d "18" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\KernelVelocity" /v "DisableFGBoostDecay" /t REG_DWORD /d "1" /f 
echo.
echo.
echo IO Tweaks Applied Sucessfully
echo ===============================
pause
goto windows

:plan
cls
echo Downloading Plan to C:\damons
echo.
md C:\damons\PowerPlan
echo.
echo [+] Downloading Resources
echo.
curl -g -k -L -# -o "C:\damons\Powerplan\damons.pow" "https://files.catbox.moe/2a716s.pow"
powercfg -import "C:\damons\Powerplan\damons.pow"
powercfg.cpl
echo   Plan Imported Sucessfully
echo ===============================
pause
goto windows

:wub
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Click disable updates and apply.', 'Damons Free Tweaking Panel', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
start C:\damons\resources\Wub.exe
@echo off
cls
echo.
echo   Any Key to Continue
echo ======================
pause
goto windows

:wsettings
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "FontSmoothingType" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AllUpView" /v "AllUpView" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AllUpView" /v "Remove TaskView" /t REG_DWORD /d "1" /f
echo Windows Settings Fully Optimized
echo ===============================
pause
goto windows


:debloat
cls
echo.

echo              ██████╗ ███████╗██████╗ ██╗      ██████╗  █████╗ ████████╗
echo              ██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗██╔══██╗╚══██╔══╝
echo              ██║  ██║█████╗  ██████╔╝██║     ██║   ██║███████║   ██║   
echo              ██║  ██║██╔══╝  ██╔══██╗██║     ██║   ██║██╔══██║   ██║   
echo              ██████╔╝███████╗██████╔╝███████╗╚██████╔╝██║  ██║   ██║   
echo              ╚═════╝ ╚══════╝╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
                                                                                                             
echo           ----------------------------------------------------------------
echo.
echo                      [1] Uninstall Apps     [2] Startup Apps           
echo.
echo                [3] What does this uninstall?      [R] Reinstall Apps
echo.
echo                                      [x] Menu
echo.
echo.
set /p choice="Choose an option (1, 2, 3, R, x): "
if "%choice%"=="R" goto deb2
if "%choice%"=="r" goto deb2
if "%choice%"=="1" goto deb1
if "%choice%"=="3" goto deb0
if "%choice%"=="x" goto main
if "%choice%"=="X" goto main
if "%choice%"=="2" goto startup






:deb0
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Uninstalls 3D Builder, Alarms and Clock, Calendar and Mail, Camera, Groove Music, Movies & TV, OneNote, People, Photos, Solitaire Collection, Sticky Notes, Xbox app, Xbox Game Bar, Xbox Console Companion, Paint 3D, Your Phone, Mixed Reality Portal.', 'Damons Free Tweaking Panel', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
goto debloat

:deb2
cls
:: Reinstall 3D Builder
powershell -Command "Get-AppxPackage -AllUsers *3dbuilder* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Alarms and Clock
powershell -Command "Get-AppxPackage -AllUsers *windowsalarms* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Calendar and Mail
powershell -Command "Get-AppxPackage -AllUsers *windowscommunicationsapps* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Camera
powershell -Command "Get-AppxPackage -AllUsers *windowscamera* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Groove Music
powershell -Command "Get-AppxPackage -AllUsers *zunemusic* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Movies & TV
powershell -Command "Get-AppxPackage -AllUsers *zunevideo* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall OneNote
powershell -Command "Get-AppxPackage -AllUsers *onenote* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall People
powershell -Command "Get-AppxPackage -AllUsers *people* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Photos
powershell -Command "Get-AppxPackage -AllUsers *photos* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Solitaire Collection
powershell -Command "Get-AppxPackage -AllUsers *solitairecollection* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Sticky Notes
powershell -Command "Get-AppxPackage -AllUsers *stickynotes* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Xbox app
powershell -Command "Get-AppxPackage -AllUsers *xboxapp* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Xbox Game Bar
powershell -Command "Get-AppxPackage -AllUsers *gamingoverlay* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Xbox Console Companion
powershell -Command "Get-AppxPackage -AllUsers *xbox* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Paint 3D
powershell -Command "Get-AppxPackage -AllUsers *paint3d* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Your Phone
powershell -Command "Get-AppxPackage -AllUsers *yourphone* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

:: Reinstall Mixed Reality Portal
powershell -Command "Get-AppxPackage -AllUsers *holographic* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"\$($_.InstallLocation)\AppXManifest.xml\"}"

echo Reinstalled Apps Click Any Key to Continue...
pause
goto debloat

:deb1
cls
:: Uninstall 3D Builder
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
:: Uninstall Alarms and Clock
powershell -Command "Get-AppxPackage *windowsalarms* | Remove-AppxPackage"
:: Uninstall Calendar and Mail
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
:: Uninstall Camera
powershell -Command "Get-AppxPackage *windowscamera* | Remove-AppxPackage"
:: Uninstall Groove Music
powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
:: Uninstall Movies & TV
powershell -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
:: Uninstall OneNote
powershell -Command "Get-AppxPackage *onenote* | Remove-AppxPackage"
:: Uninstall People
powershell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
:: Uninstall Photos
powershell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
:: Uninstall Solitaire Collection
powershell -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"
:: Uninstall Sticky Notes
powershell -Command "Get-AppxPackage *stickynotes* | Remove-AppxPackage"
:: Uninstall Xbox app
powershell -Command "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
:: Uninstall Xbox Game Bar
powershell -Command "Get-AppxPackage *gamingoverlay* | Remove-AppxPackage"
:: Uninstall Xbox Console Companion
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
:: Uninstall Paint 3D
powershell -Command "Get-AppxPackage *paint3d* | Remove-AppxPackage"
:: Uninstall Your Phone
powershell -Command "Get-AppxPackage *yourphone* | Remove-AppxPackage"
:: Uninstall Mixed Reality Portal
powershell -Command "Get-AppxPackage *holographic* | Remove-AppxPackage"
goto debloat

:startup
@echo off
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Go to startup and disable everything', 'Damons Free Tweaking Panel', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
start taskmgr

goto main



:cpu
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "AllowPepPerfStates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Cstates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Capabilities" /t REG_DWORD /d "516198" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fDisablePowerManagement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\Default\VetoPolicy" /v "EA:EnergySaverEngaged" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\28\VetoPolicy" /v "EA:PowerStateDischarging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Misc" /v "DeviceIdlePolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "PerfEnergyPreference" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "PerfEnergyPreference" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark1" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance1" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPHEADROOM" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\PowerCfg\GlobalPowerPolicy" /v "Policies" /t REG_BINARY /d "01000000020000000100000000000000020000000000000000000000000000002c0100003232030304000000040000000000000000000000840300002c01000000000000840300000001646464640000" /f
Reg.exe add "HKCU\Control Panel\PowerCfg\GlobalPowerPolicy" /v "Policies" /t REG_BINARY /d "01000000020000000100000000000000020000000000000000000000000000002c0100003232030304000000040000000000000000000000840300002c01000000000000840300000001646464640000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Cstates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Capabilities" /t REG_DWORD /d "516198" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
@echo off
cls
echo.
echo   CPU Tweaks Applied
echo ======================
echo.  
pause
goto main


:clean
@echo on
:: Delete all log files in the current directory and its subdirectories
del /a /s /q *.log

:: Remove all files from the Windows temp directory
del /s /f /q C:\Windows\Temp\*.*

:: Clear the Prefetch folder
del /s /f /q C:\Windows\Prefetch\*

:: Clear the temporary files in the user's temp directory
del /s /f /q %temp%\*.*

:: Flush the DNS cache
ipconfig /flushdns

:: Stop Windows Update services
net stop wuauserv
net stop UsoSvc

:: Remove the SoftwareDistribution folder and recreate it
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution

:: Remove all files from the user's temp directory and recreate it
rd /s /q %temp%
mkdir %temp%

:: Take ownership of the temp directories
takeown /f "%temp%" /r /d y
takeown /f "C:\Windows\Temp" /r /d y

:: Remove the Windows Temp directory and recreate it
rd /s /q C:\Windows\Temp
mkdir C:\Windows\Temp

:: Take ownership of the Windows Temp directory again
takeown /f "C:\Windows\Temp" /r /d y
takeown /f %temp% /r /d y

:: Delete temporary files and folders using the deltree command
deltree /y C:\Windows\Temp\*
deltree /y C:\Windows\Temp
deltree /y C:\Windows\Tmp
deltree /y C:\Windows\FF*.tmp
deltree /y C:\Windows\History
deltree /y C:\Windows\Cookies
deltree /y C:\Windows\Recent
deltree /y C:\Windows\Spool\Printers
@echo off
cls
echo.
echo Cleaned All Temp Files
echo ======================
echo.  
pause
goto main


:Misc
cls
echo.
echo                   ███╗   ███╗██╗███████╗ ██████╗   
echo                   ████╗ ████║██║██╔════╝██╔════╝   
echo                   ██╔████╔██║██║███████╗██║        
echo                   ██║╚██╔╝██║██║╚════██║██║        
echo                   ██║ ╚═╝ ██║██║███████║╚██████╗██╗
echo                   ╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝╚═╝                                                 
echo          ------------------------------------------------
echo.
echo      	      [1] Menu Kill Time     [2] MSI Mode   
echo.
echo                              [x] Menu
echo.
echo.
set /p choice="Choose an option (1, 2, x): "

if "%choice%"=="1" goto menuk
if "%choice%"=="2" goto msi
if "%choice%"=="x" goto main
if "%choice%"=="X" goto main


:menuk
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
echo  Sucessfully Applied
echo ======================
echo.  
goto misc


:msi
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Check MSI Mode for your GPU and set High Priority and then hit apply in top right corner.', 'Damons Free Tweaking Panel', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
start C:\damons\resources\MSI_Utility_V3.exe
@echo off
cls
echo.
echo   Any Key to Continue
echo ======================
echo.  
pause
cls
goto misc






:dqsize
start C:\damons\resources\DQ_Guide.txt
cls
echo.
echo.
echo.
echo.
echo.                    ██████╗  ██████╗     ███████╗██╗███████╗███████╗
echo.                    ██╔══██╗██╔═══██╗    ██╔════╝██║╚══███╔╝██╔════╝
echo.                    ██║  ██║██║   ██║    ███████╗██║  ███╔╝ █████╗  
echo.                    ██║  ██║██║▄▄ ██║    ╚════██║██║ ███╔╝  ██╔══╝  
echo.                    ██████╔╝╚██████╔╝    ███████║██║███████╗███████╗
echo.                    ╚═════╝  ╚══▀▀═╝     ╚══════╝╚═╝╚══════╝╚══════╝
echo.            ----------------------------------------------------------------------
echo.
echo.                   [1] 14                    [2] 15                 [3] 16           
echo.                                                                                                     
echo.                   [4] 17                    [5] 18                 [6] 19           
echo.                                                                                                     
echo.                   [7] 20                    [8] 25                 [9] 30           
echo.
echo                                           [x] Menu
echo.                                                                                                          
echo.                                                           
echo.                                                                    
echo.

set /p input=: 
if /i %input% == 1 goto 14
if /i %input% == 2 goto 15
if /i %input% == 3 goto 16
if /i %input% == 4 goto 17
if /i %input% == 5 goto 18
if /i %input% == 6 goto 19
if /i %input% == 7 goto 20
if /i %input% == 8 goto 25
if /i %input% == 9 goto 30
if /i %input% == X cls & goto main

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2 > nul
goto main





:14
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "20" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:15

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "21" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "21" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:16

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "22" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "19" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:17

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "23" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "23" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:18

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "24" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "24" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:19

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "25" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "25" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:20

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "32" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:25

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "37" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "37" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main

:30

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "48" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "48" /f

echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main


:revert

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "80" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "80" /f
echo.
echo Successfully Applied all Tweaks
echo.
echo                                                        Press any key to continue...     
pause >nul
cls
goto :main