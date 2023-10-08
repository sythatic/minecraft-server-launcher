<div align="center">
    
# `MCS Launcher`
![Static Badge](https://img.shields.io/badge/v0.0.6-RELEASE-brightgreen)
#### A simple script for launching and managing a Minecraft server from the command line interface.
    
<br>
    
</div>

## Functions

Initial Startup
- [x] Prompts the user to specify the name and extension of the server's jar file or it's path.
- [x] Prompts the user to allocate the minimum and maximum RAM for the server .
- [x] Creates a folder named "mcsl" to store the config files.
- [x] Stores the config information in the following files: core.json, min.json and max.json.

Normal Startup
- [x] Reads the values from the json files and sets them as environment variables.
- [x] Previews the server launch command.
- [x] Prompts the user to start the server or edit the start parameters.
- [X] Allows user to list installed plugins and the server.properties file.
- [x] After the server stops, users can restart the server with the same or different parameters. 
- [x] The terminal will wait for user input before exiting the script.

Issues
- [ ] (Minor) After listing plugins or server properties, pressing enter without any input will loop the previous result.

>This script will technically work from any location, but it is highly recommended that you keep it in your server's root directory.
>Do not run as admin
>If errors occur, simply enter "R" to reset the program.
