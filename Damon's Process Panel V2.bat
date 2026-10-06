@echo off
cls
title DAMON PROCESS LOWERING V2
:: Check if C:\temp exists, if not, create it
if not exist "C:\temp\" mkdir "C:\temp\"
echo [-] Creating System Restore Point (Damons Processe Lowern Restore Point)
powershell.exe -Command "Checkpoint-Computer -Description 'Damons Process Lowering V2' -RestorePointType 'MODIFY_SETTINGS'"
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
echo.
echo.
echo.
echo               ██████╗  █████╗ ███╗   ███╗ ██████╗ ███╗   ██╗███████╗    ████████╗██╗    ██╗███████╗ █████╗ ██╗  ██╗
echo               ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗████╗  ██║██╔════╝    ╚══██╔══╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝
echo               ██║  ██║███████║██╔████╔██║██║   ██║██╔██╗ ██║███████╗       ██║   ██║ █╗ ██║█████╗  ███████║█████╔╝
echo               ██║  ██║██╔══██║██║╚██╔╝██║██║   ██║██║╚██╗██║╚════██║       ██║   ██║███╗██║██╔══╝  ██╔══██║██╔═██╗
echo               ██████╔╝██║  ██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████║       ██║   ╚███╔███╔╝███████╗██║  ██║██║  ██╗
echo               ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝       ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   
echo.                                                        *wifi bug fixed*                                                                                                                                                                                                          
echo                       -------------------------------------------------------------------------------------                                                                      
echo.
echo.
echo                                         [1] Disable Bluetooth  
echo.
echo                                         [2] Disable Microsoft Store
echo.
echo                                         [3] Disable Printer Services
echo.
echo                                         [4] Disable Useless Services
echo.
echo                                         [R] Revert All
echo.
echo.
echo                               [D] Discord   [X] Better Tweaks   [Y] YouTube


echo.
echo.
echo.
set /p choice="Choose an option:"

if "%choice%"=="1" goto bluetooth
if "%choice%"=="2" goto msstore
if "%choice%"=="3" goto printer
if "%choice%"=="4" goto useless
if "%choice%"=="r" goto revert
if "%choice%"=="R" goto revert
if "%choice%"=="x" goto web2
if "%choice%"=="d" goto discord1
if "%choice%"=="y" goto youtube1
goto main



:msstore
cls
sc stop ClipSVC
sc stop uhssvc
sc stop upfc
sc stop PushToInstall
sc stop BITS
sc stop InstallService
sc stop uhssvc
sc stop UsoSvc
sc config ClipSVC start= disabled
sc config BITS start= disabled
sc config InstallService start= disabled
sc config uhssvc start= disabled
sc config UsoSvc start= disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upfc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\uhssvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ossrs" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d "1" /f
schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdates" /Disable
schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdatesAsUser" /Disable
schtasks /Change /TN "Microsoft\Windows\InstallService\SmartRetry" /Disable
schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndContinueUpdates" /Disable
schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndScanForUpdates" /Disable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Report policies" /Disable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Disable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /Disable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /Disable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /Disable
schtasks /Change /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /Disable
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main



:bluetooth
cls
sc config BTAGService start= disabled
sc config bthserv start= disabled
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main

:printer
cls
sc config PrintNotify start= disabled
sc config Spooler start= disabled
schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Disable
schtasks /Change /TN "Microsoft\Windows\Printing\PrinterCleanupTask" /Disable
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main

:useless
cls
reg add "HKLM\System\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\xbgm" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
sc config wlidsvc start= disabled

sc config DiagTrack start= disabled
sc config DusmSvc start= disabled

sc config RetailDemo start= disabled
sc config Fax start= disabled

sc config lfsvc start= disabled
sc config WpcMonSvc start= disabled
sc config SessionEnv start= disabled
sc config MicrosoftEdgeElevationService start= disabled
sc config edgeupdate start= disabled
sc config edgeupdatem start= disabled
sc config autotimesvc start= disabled
sc config CscService start= disabled
sc config TermService start= disabled
sc config SensrSvc start= disabled
sc config shpamsvc start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config PhoneSvc start= disabled
sc config TapiSrv start= disabled
sc config UevAgentService start= disabled
sc config WalletService start= disabled
sc config TokenBroker start= disabled
sc config WebClient start= disabled
sc config MixedRealityOpenXRSvc start= disabled
sc config stisvc start= disabled
sc config WbioSrvc start= disabled
sc config Wecsvc start= disabled
sc config XboxGipSvc start= disabled
sc config XblAuthManager start= disabled
sc config XboxNetApiSvc start= disabled
sc config XblGameSave start= disabled
sc config SEMgrSvc start= disabled

sc config Backupper Service start= disabled
sc config BthAvctpSvc start= disabled
sc config BDESVC start= disabled
sc config cbdhsvc start= disabled
sc config CDPSvc start= disabled

sc config DevQueryBroker start= disabled

sc config dmwappushservice start= disabled
sc config TrkWks start= disabled
sc config dLauncherLoopback start= disabled
sc config EFS start= disabled
sc config fdPHost start= disabled
sc config FDResPub start= disabled
sc config IKEEXT start= disabled
sc config WPDBusEnum start= disabled
sc config PcaSvc start= disabled
sc config RasMan start= disabled
sc config RetailDemo start=disabled
sc config SstpSvc start=disabled

sc config SSDPSRV start= disabled
sc config SysMain start= disabled
sc config OneSyncSvc start= disabled



sc config FontCache start= disabled
sc config W32Time start= disabled
sc config tzautoupdate start= disabled
sc config DsSvc start= disabled
sc config diagsvc start= disabled
sc config DialogBlockingService start= disabled
sc config PimIndexMaintenanceSvc_5f1ad start= disabled
sc config MessagingService_5f1ad start= disabled
sc config AppVClient start= disabled
sc config MsKeyboardFilter start= disabled
sc config ssh-agent start= disabled
sc config SstpSvc start= disabled
sc config OneSyncSvc_5f1ad start= disabled
sc config wercplsupport start= disabled

sc config WerSvc start= disabled
sc config WpnUserService_5f1ad start= disabled

sc config DsmSvc start= disabled
schtasks /DELETE /TN "AMDInstallLauncher" /f
schtasks /DELETE /TN "AMDLinkUpdate" /f
schtasks /DELETE /TN "AMDRyzenMasterSDKTask" /f
schtasks /DELETE /TN "Driver Easy Scheduled Scan" /f
schtasks /DELETE /TN "ModifyLinkUpdate" /f
schtasks /DELETE /TN "SoftMakerUpdater" /f
schtasks /DELETE /TN "StartCN" /f
schtasks /DELETE /TN "StartDVR" /f
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable

schtasks /Change /TN "Microsoft\Windows\Device Information\Device User" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable
schtasks /Change /TN "Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Disable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Cellular" /Disable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable
schtasks /Change /TN "Microsoft\Windows\MUI\LPRemove" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Disable
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Disable
schtasks /Change /TN "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /Disable
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable
schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Setup\SnapshotCleanupTask" /Disable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Task Manager\Interactive" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\UPnP\UPnPHostConfig" /Disable
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Management" /Disable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Validation" /Disable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Disable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Disable
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\NotificationTask" /Disable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\OobeDiscovery" /Disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable
echo.
echo   Press Any Key to Continue
echo ==============================
echo.  
pause
cls
goto main


:revert
cls
echo   -> AppVClient

sc config "AppVClient" start= auto >nul 2>&1

echo   -> BDESVC

sc config "BDESVC" start= auto >nul 2>&1

echo   -> BITS

sc config "BITS" start= auto >nul 2>&1

echo   -> BTAGService

sc config "BTAGService" start= auto >nul 2>&1

echo   -> BthAvctpSvc

sc config "BthAvctpSvc" start= auto >nul 2>&1

echo   -> CDPSvc

sc config "CDPSvc" start= auto >nul 2>&1

echo   -> ClipSVC

sc config "ClipSVC" start= auto >nul 2>&1

echo   -> CscService

sc config "CscService" start= auto >nul 2>&1

echo   -> DevQueryBroker

sc config "DevQueryBroker" start= auto >nul 2>&1

echo   -> DevicesFlowUserSvc_5f1ad

sc config "DevicesFlowUserSvc_5f1ad" start= auto >nul 2>&1

echo   -> DiagTrack

sc config "DiagTrack" start= auto >nul 2>&1

echo   -> DialogBlockingService

sc config "DialogBlockingService" start= auto >nul 2>&1

echo   -> DispBrokerDesktopSvc

sc config "DispBrokerDesktopSvc" start= auto >nul 2>&1

echo   -> DsSvc

sc config "DsSvc" start= auto >nul 2>&1

echo   -> DsmSvc

sc config "DsmSvc" start= auto >nul 2>&1

echo   -> DusmSvc

sc config "DusmSvc" start= auto >nul 2>&1

echo   -> EFS

sc config "EFS" start= auto >nul 2>&1

echo   -> FDResPub

sc config "FDResPub" start= auto >nul 2>&1

echo   -> Fax

sc config "Fax" start= auto >nul 2>&1

echo   -> FontCache

sc config "FontCache" start= auto >nul 2>&1

echo   -> IKEEXT

sc config "IKEEXT" start= auto >nul 2>&1

echo   -> InstallService

sc config "InstallService" start= auto >nul 2>&1

echo   -> MessagingService_5f1ad

sc config "MessagingService_5f1ad" start= auto >nul 2>&1

echo   -> MicrosoftEdgeElevationService

sc config "MicrosoftEdgeElevationService" start= auto >nul 2>&1

echo   -> MixedRealityOpenXRSvc

sc config "MixedRealityOpenXRSvc" start= auto >nul 2>&1

echo   -> MsKeyboardFilter

sc config "MsKeyboardFilter" start= auto >nul 2>&1

echo   -> NPSMSvc

sc config "NPSMSvc" start= auto >nul 2>&1

echo   -> NetTcpPortSharing

sc config "NetTcpPortSharing" start= auto >nul 2>&1

echo   -> OneSyncSvc

sc config "OneSyncSvc" start= auto >nul 2>&1

echo   -> OneSyncSvc_5f1ad

sc config "OneSyncSvc_5f1ad" start= auto >nul 2>&1

echo   -> PcaSvc

sc config "PcaSvc" start= auto >nul 2>&1

echo   -> PhoneSvc

sc config "PhoneSvc" start= auto >nul 2>&1

echo   -> PimIndexMaintenanceSvc_5f1ad

sc config "PimIndexMaintenanceSvc_5f1ad" start= auto >nul 2>&1

echo   -> PrintNotify

sc config "PrintNotify" start= auto >nul 2>&1

echo   -> RasMan

sc config "RasMan" start= auto >nul 2>&1

echo   -> RetailDemo

sc config "RetailDemo" start= auto >nul 2>&1

echo   -> SEMgrSvc

sc config "SEMgrSvc" start= auto >nul 2>&1

echo   -> SSDPSRV

sc config "SSDPSRV" start= auto >nul 2>&1

echo   -> SensorDataService

sc config "SensorDataService" start= auto >nul 2>&1

echo   -> SensorService

sc config "SensorService" start= auto >nul 2>&1

echo   -> SensrSvc

sc config "SensrSvc" start= auto >nul 2>&1

echo   -> SessionEnv

sc config "SessionEnv" start= auto >nul 2>&1

echo   -> Spooler

sc config "Spooler" start= auto >nul 2>&1

echo   -> SstpSvc

sc config "SstpSvc" start= auto >nul 2>&1

echo   -> SysMain

sc config "SysMain" start= auto >nul 2>&1

echo   -> TapiSrv

sc config "TapiSrv" start= auto >nul 2>&1

echo   -> TermService

sc config "TermService" start= auto >nul 2>&1

echo   -> TokenBroker

sc config "TokenBroker" start= auto >nul 2>&1

echo   -> TrkWks

sc config "TrkWks" start= auto >nul 2>&1

echo   -> UevAgentService

sc config "UevAgentService" start= auto >nul 2>&1

echo   -> UsoSvc

sc config "UsoSvc" start= auto >nul 2>&1

echo   -> W32Time

sc config "W32Time" start= auto >nul 2>&1

echo   -> WPDBusEnum

sc config "WPDBusEnum" start= auto >nul 2>&1

echo   -> WalletService

sc config "WalletService" start= auto >nul 2>&1

echo   -> WbioSrvc

sc config "WbioSrvc" start= auto >nul 2>&1

echo   -> WebClient

sc config "WebClient" start= auto >nul 2>&1

echo   -> Wecsvc

sc config "Wecsvc" start= auto >nul 2>&1

echo   -> WerSvc

sc config "WerSvc" start= auto >nul 2>&1

echo   -> WpcMonSvc

sc config "WpcMonSvc" start= auto >nul 2>&1

echo   -> WpnUserService_5f1ad

sc config "WpnUserService_5f1ad" start= auto >nul 2>&1

echo   -> XblAuthManager

sc config "XblAuthManager" start= auto >nul 2>&1

echo   -> XblGameSave

sc config "XblGameSave" start= auto >nul 2>&1

echo   -> XboxGipSvc

sc config "XboxGipSvc" start= auto >nul 2>&1

echo   -> XboxNetApiSvc

sc config "XboxNetApiSvc" start= auto >nul 2>&1

echo   -> autotimesvc

sc config "autotimesvc" start= auto >nul 2>&1

echo   -> bthserv

sc config "bthserv" start= auto >nul 2>&1

echo   -> cbdhsvc

sc config "cbdhsvc" start= auto >nul 2>&1

echo   -> dLauncherLoopback

sc config "dLauncherLoopback" start= auto >nul 2>&1

echo   -> diagnosticshub.standardcollector.service

sc config "diagnosticshub.standardcollector.service" start= auto >nul 2>&1

echo   -> diagsvc

sc config "diagsvc" start= auto >nul 2>&1

echo   -> dmwappushservice

sc config "dmwappushservice" start= auto >nul 2>&1

echo   -> edgeupdate

sc config "edgeupdate" start= auto >nul 2>&1

echo   -> edgeupdatem

sc config "edgeupdatem" start= auto >nul 2>&1

echo   -> fdPHost

sc config "fdPHost" start= auto >nul 2>&1

echo   -> icssvc

sc config "icssvc" start= auto >nul 2>&1

echo   -> lfsvc

sc config "lfsvc" start= auto >nul 2>&1

echo   -> lmhosts

sc config "lmhosts" start= auto >nul 2>&1

echo   -> shpamsvc

sc config "shpamsvc" start= auto >nul 2>&1

echo   -> ssh-agent

sc config "ssh-agent" start= auto >nul 2>&1

echo   -> stisvc

sc config "stisvc" start= auto >nul 2>&1

echo   -> tzautoupdate

sc config "tzautoupdate" start= auto >nul 2>&1

echo   -> uhssvc

sc config "uhssvc" start= auto >nul 2>&1

echo   -> wercplsupport

sc config "wercplsupport" start= auto >nul 2>&1

echo   -> wlidsvc

sc config "wlidsvc" start= auto >nul 2>&1



echo [2/3] Starting key services (best effort)...

sc start "AppVClient" >nul 2>&1

sc start "BDESVC" >nul 2>&1

sc start "BITS" >nul 2>&1

sc start "BTAGService" >nul 2>&1

sc start "BthAvctpSvc" >nul 2>&1

sc start "CDPSvc" >nul 2>&1

sc start "ClipSVC" >nul 2>&1

sc start "CscService" >nul 2>&1

sc start "DevQueryBroker" >nul 2>&1

sc start "DevicesFlowUserSvc_5f1ad" >nul 2>&1

sc start "DiagTrack" >nul 2>&1

sc start "DialogBlockingService" >nul 2>&1

sc start "DispBrokerDesktopSvc" >nul 2>&1

sc start "DsSvc" >nul 2>&1

sc start "DsmSvc" >nul 2>&1

sc start "DusmSvc" >nul 2>&1

sc start "EFS" >nul 2>&1

sc start "FDResPub" >nul 2>&1

sc start "Fax" >nul 2>&1

sc start "FontCache" >nul 2>&1

sc start "IKEEXT" >nul 2>&1

sc start "InstallService" >nul 2>&1

sc start "MessagingService_5f1ad" >nul 2>&1

sc start "MicrosoftEdgeElevationService" >nul 2>&1

sc start "MixedRealityOpenXRSvc" >nul 2>&1

sc start "MsKeyboardFilter" >nul 2>&1

sc start "NPSMSvc" >nul 2>&1

sc start "NetTcpPortSharing" >nul 2>&1

sc start "OneSyncSvc" >nul 2>&1

sc start "OneSyncSvc_5f1ad" >nul 2>&1

sc start "PcaSvc" >nul 2>&1

sc start "PhoneSvc" >nul 2>&1

sc start "PimIndexMaintenanceSvc_5f1ad" >nul 2>&1

sc start "PrintNotify" >nul 2>&1

sc start "RasMan" >nul 2>&1

sc start "RetailDemo" >nul 2>&1

sc start "SEMgrSvc" >nul 2>&1

sc start "SSDPSRV" >nul 2>&1

sc start "SensorDataService" >nul 2>&1

sc start "SensorService" >nul 2>&1

sc start "SensrSvc" >nul 2>&1

sc start "SessionEnv" >nul 2>&1

sc start "Spooler" >nul 2>&1

sc start "SstpSvc" >nul 2>&1

sc start "SysMain" >nul 2>&1

sc start "TapiSrv" >nul 2>&1

sc start "TermService" >nul 2>&1

sc start "TokenBroker" >nul 2>&1

sc start "TrkWks" >nul 2>&1

sc start "UevAgentService" >nul 2>&1

sc start "UsoSvc" >nul 2>&1

sc start "W32Time" >nul 2>&1

sc start "WPDBusEnum" >nul 2>&1

sc start "WalletService" >nul 2>&1

sc start "WbioSrvc" >nul 2>&1

sc start "WebClient" >nul 2>&1

sc start "Wecsvc" >nul 2>&1

sc start "WerSvc" >nul 2>&1

sc start "WpcMonSvc" >nul 2>&1

sc start "WpnUserService_5f1ad" >nul 2>&1

sc start "XblAuthManager" >nul 2>&1

sc start "XblGameSave" >nul 2>&1

sc start "XboxGipSvc" >nul 2>&1

sc start "XboxNetApiSvc" >nul 2>&1

sc start "autotimesvc" >nul 2>&1

sc start "bthserv" >nul 2>&1

sc start "cbdhsvc" >nul 2>&1

sc start "dLauncherLoopback" >nul 2>&1

sc start "diagnosticshub.standardcollector.service" >nul 2>&1

sc start "diagsvc" >nul 2>&1

sc start "dmwappushservice" >nul 2>&1

sc start "edgeupdate" >nul 2>&1

sc start "edgeupdatem" >nul 2>&1

sc start "fdPHost" >nul 2>&1

sc start "icssvc" >nul 2>&1

sc start "lfsvc" >nul 2>&1

sc start "lmhosts" >nul 2>&1

sc start "shpamsvc" >nul 2>&1

sc start "ssh-agent" >nul 2>&1

sc start "stisvc" >nul 2>&1

sc start "tzautoupdate" >nul 2>&1

sc start "uhssvc" >nul 2>&1

sc start "wercplsupport" >nul 2>&1

sc start "wlidsvc" >nul 2>&1



echo [3/3] Re-enabling scheduled tasks...

echo   -> Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser

schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Application Experience\PcaPatchDbTask

schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Application Experience\ProgramDataUpdater

schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Application Experience\StartupAppTask

schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Autochk\Proxy

schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Customer Experience Improvement Program\Consolidator

schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Customer Experience Improvement Program\UsbCeip

schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Enable >nul 2>&1

echo   -> Microsoft\Windows\DUSM\dusmtask

schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Defrag\ScheduledDefrag

schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Device Information\Device User

schtasks /Change /TN "Microsoft\Windows\Device Information\Device User" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner

schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Diagnosis\Scheduled

schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Enable >nul 2>&1

echo   -> Microsoft\Windows\DiskCleanup\SilentCleanup

schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Enable >nul 2>&1

echo   -> Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector

schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Enable >nul 2>&1

echo   -> Microsoft\Windows\DiskFootprint\Diagnostics

schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Enable >nul 2>&1

echo   -> Microsoft\Windows\DiskFootprint\StorageSense

schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Enable >nul 2>&1

echo   -> Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask

schtasks /Change /TN "Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Feedback\Siuf\DmClient

schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload

schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Enable >nul 2>&1

echo   -> Microsoft\Windows\FileHistory\File History (maintenance mode)

schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures

schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing

schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting

schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Flighting\OneSettings\RefreshCache

schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Input\LocalUserSyncDataAvailable

schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Input\MouseSyncDataAvailable

schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Input\PenSyncDataAvailable

schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Input\TouchpadSyncDataAvailable

schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Enable >nul 2>&1

echo   -> Microsoft\Windows\InstallService\ScanForUpdates

schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdates" /Enable >nul 2>&1

echo   -> Microsoft\Windows\InstallService\ScanForUpdatesAsUser

schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdatesAsUser" /Enable >nul 2>&1

echo   -> Microsoft\Windows\InstallService\SmartRetry

schtasks /Change /TN "Microsoft\Windows\InstallService\SmartRetry" /Enable >nul 2>&1

echo   -> Microsoft\Windows\InstallService\WakeUpAndContinueUpdates

schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndContinueUpdates" /Enable >nul 2>&1

echo   -> Microsoft\Windows\InstallService\WakeUpAndScanForUpdates

schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndScanForUpdates" /Enable >nul 2>&1

echo   -> Microsoft\Windows\International\Synchronize Language Settings

schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Enable >nul 2>&1

echo   -> Microsoft\Windows\LanguageComponentsInstaller\Installation

schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Enable >nul 2>&1

echo   -> Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources

schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Enable >nul 2>&1

echo   -> Microsoft\Windows\LanguageComponentsInstaller\Uninstallation

schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Enable >nul 2>&1

echo   -> Microsoft\Windows\License Manager\TempSignedLicenseExchange

schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Enable >nul 2>&1

echo   -> Microsoft\Windows\MUI\LPRemove

schtasks /Change /TN "Microsoft\Windows\MUI\LPRemove" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Maintenance\WinSAT

schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Management\Provisioning\Cellular

schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Cellular" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Management\Provisioning\Logon

schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Maps\MapsToastTask

schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Maps\MapsUpdateTask

schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser

schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Enable >nul 2>&1

echo   -> Microsoft\Windows\NetTrace\GatherNetworkInfo

schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Enable >nul 2>&1

echo   -> Microsoft\Windows\PI\Sqm-Tasks

schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem

schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Printing\EduPrintProv

schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Printing\PrinterCleanupTask

schtasks /Change /TN "Microsoft\Windows\Printing\PrinterCleanupTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\PushToInstall\Registration

schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Ras\MobilityManager

schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Enable >nul 2>&1

echo   -> Microsoft\Windows\RecoveryEnvironment\VerifyWinRE

schtasks /Change /TN "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /Enable >nul 2>&1

echo   -> Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask

schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\RetailDemo\CleanupOfflineContent

schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Servicing\StartComponentCleanup

schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Enable >nul 2>&1

echo   -> Microsoft\Windows\SettingSync\NetworkStateChangeTask

schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Setup\SetupCleanupTask

schtasks /Change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Setup\SnapshotCleanupTask

schtasks /Change /TN "Microsoft\Windows\Setup\SnapshotCleanupTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\SpacePort\SpaceAgentTask

schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\SpacePort\SpaceManagerTask

schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Speech\SpeechModelDownloadTask

schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization

schtasks /Change /TN "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Sysmain\ResPriStaticDbSync

schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Sysmain\WsSwapAssessmentTask

schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\TPM\Tpm-HASCertRetr

schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /Enable >nul 2>&1

echo   -> Microsoft\Windows\TPM\Tpm-Maintenance

schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Task Manager\Interactive

schtasks /Change /TN "Microsoft\Windows\Task Manager\Interactive" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Time Synchronization\ForceSynchronizeTime

schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Time Synchronization\SynchronizeTime

schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Time Zone\SynchronizeTimeZone

schtasks /Change /TN "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /Enable >nul 2>&1

echo   -> Microsoft\Windows\UPnP\UPnPHostConfig

schtasks /Change /TN "Microsoft\Windows\UPnP\UPnPHostConfig" /Enable >nul 2>&1

echo   -> Microsoft\Windows\UpdateOrchestrator\Report policies

schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Report policies" /Enable >nul 2>&1

echo   -> Microsoft\Windows\UpdateOrchestrator\Schedule Scan

schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Enable >nul 2>&1

echo   -> Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task

schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /Enable >nul 2>&1

echo   -> Microsoft\Windows\UpdateOrchestrator\USO_UxBroker

schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /Enable >nul 2>&1

echo   -> Microsoft\Windows\UpdateOrchestrator\UpdateModelTask

schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\User Profile Service\HiveUploadTask

schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\WDI\ResolutionHost

schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Enable >nul 2>&1

echo   -> Microsoft\Windows\WOF\WIM-Hash-Management

schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Management" /Enable >nul 2>&1

echo   -> Microsoft\Windows\WOF\WIM-Hash-Validation

schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Validation" /Enable >nul 2>&1

echo   -> Microsoft\Windows\WaaSMedic\PerformRemediation

schtasks /Change /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange

schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Enable >nul 2>&1

echo   -> Microsoft\Windows\WindowsUpdate\Scheduled Start

schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Work Folders\Work Folders Logon Synchronization

schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Work Folders\Work Folders Maintenance Work

schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Enable >nul 2>&1

echo   -> Microsoft\Windows\Workplace Join\Automatic-Device-Join

schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Enable >nul 2>&1

echo   -> Microsoft\Windows\WwanSvc\NotificationTask

schtasks /Change /TN "Microsoft\Windows\WwanSvc\NotificationTask" /Enable >nul 2>&1

echo   -> Microsoft\Windows\WwanSvc\OobeDiscovery

schtasks /Change /TN "Microsoft\Windows\WwanSvc\OobeDiscovery" /Enable >nul 2>&1

echo   -> Microsoft\XblGameSave\XblGameSaveTask

schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Enable >nul 2>&1

pause.
goto main