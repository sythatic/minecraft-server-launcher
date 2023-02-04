<h1 align="center">MCS Launcher</h1>

<p align="center">A simple script for launching and managing Minecraft servers from the Command Line Interface.</p>
</br>
  
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
- [x] After the server stops, users can restart the server with the same or different parameters. 
- [x] The terminal will wait for user input before exiting the script.

Debug
- [x] There are currently no known issues with this version.
- [x] If errors do occur, simply enter "R" to reset the program.

### This script will work from any location, but it is highly recommended that you keep it in your server's root directory.
