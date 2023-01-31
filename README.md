<h1 align="center">MCS Launcher</h1>

<p align="center">A simple script for launching and managing Minecraft servers from the Command Line Interface.</p>
</br>
  
## Functions

Initial Startup
- [x] Prompts the user to specify the name and extension of the server's jar file or it's path.
- [x] Prompts the user to allocate the minimum and maximum RAM for the server .
- [x] Creates a folder named "boot" to store the config files.
- [x] Stores the config information in the following files: server_core.json, minram.json and maxram.json.

Normal Startup
- [x] Reads the values from the json files and sets them as environment variables server_core, minram, and maxram.
- [x] Previews the server launch command.
- [x] Allows the user to start the server or easily make changes to the config.
- [x] If the user chooses to start the server, the script launches it with the specified parameters.
- [x] After the server stops, users can restart the server with the same or different parameters. 
- [x] The terminal will wait for user input before exiting the script.

Debug
- [x] In the event of errors, the user can reset the app by entering "fix" at any Y/N prompt. 
- [x] There are currently no known issues with this version.

### This script will work from any location, but it is highly recommended that you keep it in your server's root directory.
