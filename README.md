# Code

### First we ask for administrator permission :

    set "params=%*"
    cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

### Then go to Windows themes folder and swap between light and dark using simple file as flag (switch)

    cd C:\Windows\Resources\Themes

    IF EXIST "theme_flag.txt" (
    
    start "" "C:\Windows\Resources\Themes\dark.theme"
    & timeout /t 1 
    & taskkill /im "systemsettings.exe" /f
    del /f theme_flag.txt

    ) ELSE (

    start "" "C:\Windows\Resources\Themes\aero.theme" 
    & timeout /t 1 
    & taskkill /im "systemsettings.exe" /f
	type nul > theme_flag.txt
    )
    exit

### It goes to settings to change the theme and after 1 second it closes.


# Creating the executable:

The executable was made through the app [Bat_To_Exe_Converter_x64](https://bat-to-exe-converter-x64.en.softonic.com/).

During the creation the part of the code useful to request the administrator permissions have been removed because it was set through the app.

![Icon of executable](../swap-dark-light-windows-theme-quickly-app/icon_of_executable.png)

The icon has been taken from [Icons8 Pichon](https://icons8.com/).