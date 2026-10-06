@echo off
echo Disabling Windows Search service...

:: Stop the Windows Search service
net stop "Windows Search"

:: Disable the Windows Search service to prevent it from starting automatically
sc config "WSearch" start= disabled

echo Windows Search has been disabled.

REM Set taskbar alignment to left
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarAl /T REG_DWORD /D 0 /F

REM Enable dark mode
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V AppsUseLightTheme /T REG_DWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V SystemUsesLightTheme /T REG_DWORD /D 0 /F

REM Disable transparency effects
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V EnableTransparency /T REG_DWORD /D 0 /F

REM Disable Task View button
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowTaskViewButton /T REG_DWORD /D 0 /F

REM Disable Widgets button
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarDa /T REG_DWORD /D 0 /F

REM Hide search box from taskbar
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /V SearchboxTaskbarMode /T REG_DWORD /D 0 /F

REM Disable News and Interests (weather on taskbar)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /V ShellFeedsTaskbarViewMode /T REG_DWORD /D 2 /F

REM Restart Explorer to apply changes
taskkill /f /im explorer.exe
start explorer.exe


:: Disable Widgets using PowerShell
powershell -Command "Get-AppxPackage -AllUsers *WebExperience* | Remove-AppxPackage -AllUsers"

:: Remove the Web Experience Pack service
powershell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like '*WebExperience*' | Remove-AppxProvisionedPackage -Online"

:: Disable the Widgets service
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f

echo Cleaning up any remaining files...

:: Delete Widgets system folder if present (requires TrustedInstaller permissions)
takeown /f "%SystemRoot%\SystemApps\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" /r /d y >nul
icacls "%SystemRoot%\SystemApps\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" /grant administrators:F /t >nul
rd /s /q "%SystemRoot%\SystemApps\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy"

echo Widgets have been uninstalled and removed.
pause