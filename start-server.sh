#!/bin/bash

echo ""
echo "MINECRAFT SERVER LAUNCHER (CLI) v0.0.1"
echo ""

if [ -d "boot" ]; then
goto match
else
goto setup
fi

:setup
echo "Specify the name and extension of the server's jar file"
echo " -- can also be a path"
read -p "Server File: " server_core
if [ ! -d "boot" ]; then
mkdir boot
fi
echo "$server_core" > boot/server_core.json
echo ""
echo "RAM/Memory Allocation in MB or GB"
echo " -- Must be numerical"
echo " -- Must include units / ex. 1024M or 1G"
read -p "Min: " minram
echo "$minram" > boot/minram.json
read -p "Max: " maxram
echo "$maxram" > boot/maxram.json

:match
server_core=$(cat boot/server_core.json)
minram=$(cat boot/minram.json)
maxram=$(cat boot/maxram.json)

:start
echo ""
echo "Preview: java -Xms$minram -Xmx$maxram -jar $server_core nogui"
echo ""

:changes
read -p "Make Changes? (Y/N): " modify
if [ "$modify" == "Y" ]; then
goto setup
elif [ "$modify" == "N" ]; then
goto boot
elif [ "$modify" == "fix" ]; then
goto fix
else
goto changes
fi

:boot
echo ""
echo "-- press any key to start the server --"
read -p ""
echo ""

java -Xms$minram -Xmx$maxram -jar $server_core nogui

:prompt
echo ""
read -p "Close Terminal? (Y/N): " input
if [ "$input" == "N" ]; then
goto start
elif [ "$input" == "Y" ]; then
exit
elif [ "$input" == "fix" ]; then
:fix
rm -rf boot
exit
else
goto prompt
fi
