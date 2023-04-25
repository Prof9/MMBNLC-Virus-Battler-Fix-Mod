@echo off
setlocal enabledelayedexpansion

rem Mod info
set "MOD_DIR=FixVirusBattlerRewards_EXE6"

rem Install locations
set "7Z=C:\Program Files\7-Zip\7z.exe"
set "VOL2_DIR=C:\Program Files (x86)\Steam\steamapps\common\MegaMan_BattleNetwork_LegacyCollection_Vol2"

rem Temporary folder
set "TEMP_DIR=_temp"
set "BUILD_DIR=_build"
set "BUILD_DIR_VOL2=!BUILD_DIR!\!MOD_DIR!"
set "INSTALL_DIR_VOL2=!VOL2_DIR!\exe\mods\!MOD_DIR!"

if /I [%1]==[clean] (
	echo Removing temp folder...
	if exist "!TEMP_DIR!" (
		rmdir /S /Q "!TEMP_DIR!" ^
			1> nul || goto :error
	)
	echo Removing build folder...
	if exist "!BUILD_DIR!" (
		rmdir /S /Q "!BUILD_DIR!" ^
			1> nul || goto :error
	)
	echo.

	goto :done
)

if /I [%1]==[install] (
	if exist "!VOL2_DIR!" (
		if exist "!BUILD_DIR_VOL2!" (
			echo Installing for Volume 2...

			echo Copying mod folder...
			if exist "!INSTALL_DIR_VOL2!" (
				del /F /S /Q "!INSTALL_DIR_VOL2!\*" 1> nul || goto :error
			) else (
				mkdir "!INSTALL_DIR_VOL2!" 1> nul || goto :error
			)
			robocopy /E "!BUILD_DIR_VOL2!" "!INSTALL_DIR_VOL2!" 1> nul
			if errorlevel 8 goto :error
		) else (
			echo Volume 2 not built; skipping...
		)
	) else (
		echo Volume 2 not installed; skipping...
	)
	echo.

	goto :done
)

if /I [%1]==[uninstall] (
	if exist "!VOL2_DIR!" (
		echo Uninstalling for Volume 2...
		if exist "!INSTALL_DIR_VOL2!" (
			rmdir /S /Q "!INSTALL_DIR_VOL2!" ^
				1> nul || goto :error
		)
	) else (
		echo Volume 2 not installed; skipping...
	)
	echo.

	goto :done
)

rem Clean up temp folder
call :clean_folder "!TEMP_DIR!"

rem Build mod
echo Building for Volume 2...

rem Clean build folder
call :clean_folder "!BUILD_DIR_VOL2!\msg"

rem Build message files
"tools\TextPet.exe" ^
	Load-Plugins "tools\plugins" ^
	Game MMBN6-LC ^
	Read-Text-Archives "tpl" --format tpl ^
	Write-Text-Archives "!BUILD_DIR_VOL2!\msg" --format msg ^
	1> nul || goto :error

echo Copying info files...
copy /Y "info.toml" "!BUILD_DIR_VOL2!\info.toml" ^
	1> nul || goto :error
copy /Y "init.lua" "!BUILD_DIR_VOL2!\init.lua" ^
	1> nul || goto :error
echo.

rem Copy miscellaneous files
copy /Y "readme.md" "!BUILD_DIR!\readme.txt" ^
	1> nul || goto :error

:done
echo Done.
echo.
exit /b 0

:error
echo Error occurred, failed to build.
echo.
exit /b 1

:clean_folder
if exist "%1" (
	del /F /S /Q "%1\*" 1> nul || goto :error
) else (
	mkdir "%1" 1> nul || goto :error
)
