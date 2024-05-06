@echo off
setlocal

:: Specify the folder name and file name
set "folderName=MyFolder"
set "fileName=MyFile.txt"

:: Get the desktop path
for /f "tokens=2 delims==" %%I in ('wmic useraccount where name='%username%' get desktop ^| findstr /r /v "^$"') do set "desktopPath=%%I"

:: Create the folder on the desktop
mkdir "%desktopPath%\%folderName%"

:: Create the file inside the folder
copy NUL "%desktopPath%\%folderName%\%fileName%" > nul

echo Folder "%folderName%" and file "%fileName%" created on the desktop.
pause
