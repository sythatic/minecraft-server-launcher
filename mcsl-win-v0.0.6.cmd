@echo off
:top
echo:
echo   [42m MCS Launcher [0m
echo   [90mv0.0.6 [0m
echo:

if exist mcsl goto match

echo   [93mMake sure that you run this script from your server's root directory [0m
:config
if exist rmdir mcsl /s /q
echo:
echo   [7m Enter the name and extension of your server's jar file [0m
echo:
set /p core="[0m  Server File: "
if not exist mcsl mkdir mcsl
echo %core%>>mcsl/core.json
echo:
echo   [7m RAM/Memory allocation in MB or GB [0m
echo:
echo    [93m- Must be numerical[0m
echo    [93m- Must include units / eg. 1024M or 1G[0m
echo:
set /p min="[0m  Min: "
echo %min%>>mcsl/min.json
set /p max="[0m  Max: "
echo %max%>>mcsl/max.json

:match
for /f "delims=" %%a in (mcsl/core.json) do set core=%%a
for /f "delims=" %%a in (mcsl/min.json) do set min=%%a
for /f "delims=" %%a in (mcsl/max.json) do set max=%%a

:prompt
echo:
echo   [7m The following command is set to be executed [0m
echo:
echo   [93m java -Xms%min% -Xmx%max% -jar %core% nogui [0m
echo:
echo   [0mStart Server       [93m[S]    [0mEdit Config     [93m[E]
echo   [0mServer Properties  [93m[C]    [0mList Plugins    [93m[P]
echo   [0mReset Script       [93m[R]    [0mClose Terminal  [93m[X] [0m
echo:
:cmd
set /p modify="[0m  $: "
if /i "%modify%"=="E" goto config
if /i "%modify%"=="P" (
  echo:
  echo [92m[Installed Plugins][0m
  echo:
  dir /b /a-d plugins\*.jar
  echo:
  echo [91m[End of List][0m
  goto prompt
)
if /i "%modify%"=="S" goto start
if /i "%modify%"=="C" (
  echo:
  echo [92m[Server Properties][0m
  echo:
  type server.properties
  echo:
  echo [91m[End of List][0m
  goto prompt
)
if /i "%modify%"=="X" exit
if /i "%modify%"=="R" (
  rmdir mcsl /s /q
  exit
) else (
  goto cmd
)

:start
if not exist eula.txt echo eula=true>>eula.txt
echo:
java -Xms%min% -Xmx%max% -jar %core% nogui
goto prompt
