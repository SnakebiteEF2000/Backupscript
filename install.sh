# Check if script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

# Store path to directory of current script
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")

# Create path to Python script
PYTHON_SCRIPT_PATH="$SCRIPT_PATH/python/main.py"

# Create path to ssh script
SSH_SCRIPT_PATH="$SCRIPT_PATH/install.sh"

# Set interval for cron job to run once per day at 00:00
interval=1440

# Add Python script to crontab
sudo crontab -l > temp_cron
sudo echo "*/$interval * * * * python3 $PYTHON_SCRIPT_PATH" >> temp_cron
sudo crontab temp_cron
sudo rm temp_cron

echo "Python script has been added to crontab."
echo "SSH key gen script will run now"

source "$SSH_SCRIPT_PATH"
