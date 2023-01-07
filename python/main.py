import subprocess
import logging
import traceback
import datetime

# Define remote host, username, and password
# resync-backup is the standard user created by the client instalation script
REMOTE_HOST = "resync-backup@remotehost"
PASSWORD = "password"

# Define path to log file
LOG_FILE = "/path/to/log/log.log"

# Define path to source directory
SOURCE_DIR = "/home/..."

# Get current timestamp and use it to create destination directory
timestamp = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
DEST_DIR = f"/path/to/backup/{timestamp}/"

# Configure logging
logging.basicConfig(filename=LOG_FILE, level=logging.ERROR)

def backup():
    try:
        # Run rsync command with appropriate options
        subprocess.run(
            ["rsync", "-avz", "--delete", f"--password-file={PASSWORD}", SOURCE_DIR, f"{REMOTE_HOST}:{DEST_DIR}"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
    except subprocess.CalledProcessError as e:
        # Log error if process fails
        logging.error(f"Error while backing up {SOURCE_DIR} to {REMOTE_HOST}: {e}\n{traceback.format_exc()}")
    else:
        # Log success if process succeeds
        logging.info(f"Successfully backed up {SOURCE_DIR} to {REMOTE_HOST}.")

# Run function
backup()
