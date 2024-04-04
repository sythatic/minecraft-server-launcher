<div align="center">
    
# `MCS Launcher`
#### A simple script for launching and managing a Minecraft server from the command line interface.
</div>

> [!CAUTION]
> `DO NOT RUN AS ADMIN`

> [!NOTE]
> **Initial Startup**
> - Prompts the user to specify the name and extension of the server's jar file or it's path.
> - Prompts the user to allocate the minimum and maximum RAM for the server .
> - Creates a folder named "mcsl" to store the config files.
> - Stores the config information in the following files: core.json, min.json and max.json.
> 
> **Normal Startup**
> - Reads the values from the json files and sets them as environment variables.
> - Previews the server launch command.
> - Prompts the user to start the server or edit the start parameters.
> - Allows user to list installed plugins and the server.properties file.
> - After the server stops, users can restart the server with the same or different parameters. 
> - The terminal will wait for user input before exiting the script.

> [!TIP]
> - This script will technically work from any location, but it is highly recommended that you keep it in your server's root directory.
> - If errors occur, simply enter "R" to reset the program.

> [!WARNING]
> `Minor Issue` After listing plugins or server properties, pressing enter without any input will loop the previous result.
