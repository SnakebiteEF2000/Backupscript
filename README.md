# Backup Script

This repository contains a script for performing backups of a directory using `rsync` and setting up a cron job to run the backups on a regular basis. It also includes a script for setting up a user and folder to store the backups on the receiving end.

## Prerequisites

Before using the scripts, make sure that you have the following installed:

- [`Resync`](https://github.com/resync/resync)
- Python 3

## Installation

To install and use the backup script, follow these steps:


### Server

1. Clone the repository onto the server.
2. Edit the `main.py` script to set the `REMOTE_HOST`, `PASSWORD`, `LOG_FILE`, and `SOURCE_DIR` variables to the appropriate values.
3. Make sure you run the `install.sh` script as root
4. Run the cron job script using the command `sudo bash path/to/install.sh`.
5. A Second script starts up automatically which will prompt you for a remote host `user@example.com`. the script generates a ssh key and copies it to the spezified remote host, which has to be the Client (Receiving End).

### Client (Receiving End)

1. Clone the repository onto the receiving end.
2. Run the setup script using the command `bash path/to/script/Client_instalation/install.sh`.
4. The script will create a user named `resync-backup`, a folder named `backups` in the user's home directory, and set the appropriate permissions for the folder.
5. A Second script starts up automatically which will prompt you for a remote host `user@example.com`. the script generates a ssh key and copies it to the spezified remote host, which has to be the server.



For more information on Resync refere to [there Github](https://github.com/resync/resync)
That's it! The server will now perform backups of the specified directory on a regular basis, and store the backups in the `backups` folder on the receiving end.
