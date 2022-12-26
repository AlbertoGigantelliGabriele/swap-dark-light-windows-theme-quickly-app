:: Requires administrator permission
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

cd C:\Windows\Resources\Themes
IF EXIST "theme_flag.txt" (
    start "" "C:\Windows\Resources\Themes\dark.theme" & timeout /t 1 & taskkill /im "systemsettings.exe" /f
	del /f theme_flag.txt
) ELSE (
    start "" "C:\Windows\Resources\Themes\aero.theme" & timeout /t 1 & taskkill /im "systemsettings.exe" /f
	type nul > theme_flag.txt
)

exit

::it goes to settings to change the theme but after 1 second it closes it
