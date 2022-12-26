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

### An alternative could be trying to close settings with for loop

	cd /d "C:\Windows\Resources\Themes"

	if exist "theme_flag.txt" (
	  start "" "C:\Windows\Resources\Themes\dark.theme"

	  :: Try to close the "systemsettings.exe" process 4 times, with a delay of 1 second between each attempt
	  for /l %%i in (1,1,4) do (
	    timeout /t 1 > nul
	    tasklist /fi "imagename eq systemsettings.exe" > nul
	    for /f "tokens=2" %%j in ('tasklist /fi "imagename eq systemsettings.exe" ^| find /i "systemsettings.exe"') do (
	      taskkill /pid %%j /f > nul
	    )
	  )
	  del /f theme_flag.txt
	) else (
	  start "" "C:\Windows\Resources\Themes\aero.theme"

	  :: Try to close the "systemsettings.exe" process 4 times, with a delay of 1 second between each attempt
	  for /l %%i in (1,1,4) do (
	    timeout /t 1 > nul
	    tasklist /fi "imagename eq systemsettings.exe" > nul
	    for /f "tokens=2" %%j in ('tasklist /fi "imagename eq systemsettings.exe" ^| find /i "systemsettings.exe"') do (
	      taskkill /pid %%j /f > nul
	    )
	  )
	  type nul > theme_flag.txt
	)

# Creating the executable:

The executable was made through the app [Bat_To_Exe_Converter_x64](https://bat-to-exe-converter-x64.en.softonic.com/).
