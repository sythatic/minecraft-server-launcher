@echo off

echo:
echo MINECRAFT SERVER LAUNCHER (CLI) v0.0.1

if exist boot goto match

:setup
echo:
echo Specify the name and extension of the server's jar file
echo  -- can also be a path
set /p server_core="Server File: "
if not exist boot mkdir boot
echo %server_core%>>boot/server_core.json
echo:
echo RAM/Memory Allocation in MB or GB
echo  -- Must be numerical
echo  -- Must include units / ex. 1024M or 1G
set /p minram="Min: "
echo %minram%>>boot/minram.json
set /p maxram="Max: "
echo %maxram%>>boot/maxram.json

:match
for /f "delims=" %%a in (boot/server_core.json) do set server_core=%%a
for /f "delims=" %%a in (boot/minram.json) do set minram=%%a
for /f "delims=" %%a in (boot/maxram.json) do set maxram=%%a

:start
echo:
echo Preview: java -Xms%minram% -Xmx%maxram% -jar %server_core% nogui
echo:

:changes
set /p modify= Make Changes? (Y/N): 
if /i "%modify%"=="Y" goto setup
if /i "%modify%"=="N" goto boot
if /i "%modify%"=="fix" goto fix else (
  goto changes
  )

:boot
echo:
echo -- press any key to start the server --
pause >nul
echo:

java -Xms%minram% -Xmx%maxram% -jar %server_core% nogui

:prompt
echo:
set /p input= Close Terminal? (Y/N): 
if /i "%input%"=="N" goto start
if /i "%input%"=="Y" exit
if /i "%input%"=="fix" (
  :fix
  rmdir boot /s /q
  exit
) else (
  goto prompt
  )

