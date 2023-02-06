@echo off

echo:
echo MCS LAUNCHER v0.0.2

if exist mcsl goto match

:config
echo:
echo Specify the name and extension of the server's jar file.
echo  -- can also be a path
set /p core="Server File: "
if not exist mcsl mkdir mcsl
echo %core%>>mcsl/core.json
echo:
echo RAM/Memory allocation in MB or GB
echo  -- Must be numerical
echo  -- Must include units / eg. 1024M or 1G
set /p min="Min: "
echo %min%>>mcsl/min.json
set /p max="Max: "
echo %max%>>mcsl/max.json

:match
for /f "delims=" %%a in (mcsl/core.json) do set core=%%a
for /f "delims=" %%a in (mcsl/min.json) do set min=%%a
for /f "delims=" %%a in (mcsl/max.json) do set max=%%a

:preview
echo:
echo Preview: java -Xms%min% -Xmx%max% -jar %core% nogui
echo:

:prompt
echo Start Server (S) Edit Config (E) Close Terminal (X) Reset (R)
set /p modify=$: 
if /i "%modify%"=="E" goto config
if /i "%modify%"=="S" goto start
if /i "%modify%"=="X" exit
if /i "%modify%"=="R"  (
  rmdir mcsl /s /q
  exit
) else (
  goto prompt
)

:start
java -Xms%min% -Xmx%max% -jar %core% nogui
goto preview
