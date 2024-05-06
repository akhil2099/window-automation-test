@echo off
setlocal

REM Define the folder name and file name
set "folderName=MyFolder"
set "fileName=MyFile.txt"

REM Get the path to the desktop folder
for /f "tokens=2 delims==;" %%A in ('wmic path win32_userprofile get desktop^|findstr /r /v "^$"') do (
    set "desktopPath=%%A"
)

REM Create the folder if it doesn't exist
if not exist "%desktopPath%\%folderName%\" (
    mkdir "%desktopPath%\%folderName%"
)

REM Create the file inside the folder
type nul > "%desktopPath%\%folderName%\%fileName%"

echo File created successfully.

endlocal
