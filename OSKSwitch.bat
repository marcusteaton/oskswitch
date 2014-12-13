@echo off

REM Set window title
title OSKSwitch - http://marcus.crisisresponseunit.com/

REM Take user back here if the choice isn't valid
:menu

REM Tell user what we will do
echo This script will allow you to enable or disable the On-Screen-Keyboard during login prompt. This only works on XP Tablet Edition.
echo.

REM Blank "choice" variable to clear current value
set choice=""

REM Prompt user for selection
set /p choice=Press E to enable, D to disable: 

REM List of valid selections
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='D' goto disable
if '%choice%'=='d' goto disable
if '%choice%'=='E' goto enable
if '%choice%'=='e' goto enable

REM Display message if choice was not valid
echo.
echo "%choice%" is not a option!
echo Press a key to go back.
pause > NUL

REM Clear the previous attempt's text and go back to the prompt
cls
goto menu

REM If we chose enable, run the following
:enable
cls

REM Tell the user what we're doing
echo Turning the OSK on...

REM Register the dll for the OSK and tell the user when we're done, then wait for input
regsvr32 "C:\Program Files\Common Files\Microsoft Shared\Ink\loginkey.dll"
echo Done. Press a key to exit.
pause > NUL
exit

REM If we chose disable, run the following
:disable
cls

REM Tell the user what we're doing
echo Turning the OSK off...

REM Unregister the dll for the OSK and tell the user when we're done, then wait for input
regsvr32 /u "C:\Program Files\Common Files\Microsoft Shared\Ink\loginkey.dll"
echo Done. Press a key to exit.
pause > NUL