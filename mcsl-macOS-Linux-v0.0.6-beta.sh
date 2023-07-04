#!/bin/bash

while true; do
    echo
    echo "   MCS Launcher"
    echo "   v0.0.6"
    echo

    if [ -e mcsl ]; then
        break
    fi

    echo "   Make sure that you run this script from your server's root directory"
    
    echo
    echo "   Enter the name and extension of your server's jar file"
    echo
    read -p "  Server File: " core

    mkdir -p mcsl
    echo $core > mcsl/core.json

    echo
    echo "   RAM/Memory allocation in MB or GB"
    echo
    echo "   - Must be numerical"
    echo "   - Must include units / eg. 1024M or 1G"
    echo
    read -p "  Min: " min
    echo $min > mcsl/min.json
    read -p "  Max: " max
    echo $max > mcsl/max.json
done

core=$(cat mcsl/core.json)
min=$(cat mcsl/min.json)
max=$(cat mcsl/max.json)

while true; do
    echo
    echo "   The following command is set to be executed"
    echo
    echo "   java -Xms$min -Xmx$max -jar $core nogui"
    echo
    echo "Start Server       [S]    Edit Config     [E]"
    echo "Server Properties  [C]    List Plugins    [P]"
    echo "Reset Script       [R]    Close Terminal  [X]"
    echo
    read -p "$: " modify

    if [ "$modify" == "E" ]; then
        echo
        echo "   Enter the name and extension of your server's jar file"
        echo
        read -p "  Server File: " core
        echo $core > mcsl/core.json

        echo
        echo "   RAM/Memory allocation in MB or GB"
        echo
        echo "   - Must be numerical"
        echo "   - Must include units / eg. 1024M or 1G"
        echo
        read -p "  Min: " min
        echo $min > mcsl/min.json
        read -p "  Max: " max
        echo $max > mcsl/max.json
    elif [ "$modify" == "P" ]; then
        echo
        echo "[Installed Plugins]"
        echo
        ls plugins/*.jar
        echo
        echo "[End of List]"
    elif [ "$modify" == "S" ]; then
        if [ ! -e eula.txt ]; then
            echo "eula=true" > eula.txt
        fi
        echo
        java -Xms$min -Xmx$max -jar $core nogui
    elif [ "$modify" == "C" ]; then
        echo
        echo "[Server Properties]"
        echo
        cat server.properties
        echo
        echo "[End of List]"
    elif [ "$modify" == "X" ]; then
        exit
    elif [ "$modify" == "R" ]; then
        rm -rf mcsl
        exit
    fi
done
