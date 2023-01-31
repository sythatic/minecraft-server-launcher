<h1 align="center">MCS Launcher</h1>

<p align="center">A simple script for launching and managing Minecraft servers from the Command Line Interface.</p>
</br>
  
## Functions

- Prompts the user to specify the name and extension of the server's jar file or its path and stores the information in the file "server_core.json".
- Prompts the user to allocate the minimum and maximum RAM for the server and stores the information in the files "minram.json" and "maxram.json", respectively.
- Reads the values from the json files and sets them as environment variables "server_core", "minram", and "maxram".
- Previews the server launch command.
- Asks the user if they want to make changes or start the server. If the user chooses to start the server, the script launches it with the specified parameters.
- Asks the user if they want to close the terminal. If the user chooses to close the terminal, the script will exit.
- If the user enters "fix", the script will remove the "boot" directory and exit.


## Installation & Use
This script will work from any location, but it is highly recommended that you keep it in your server's root directory.
