# Check if script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

# Store path to directory of current script
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")

# Create path to Python script
PYTHON_SCRIPT_PATH="$SCRIPT_PATH/python/main.py"

# Set interval for cron job to run once per day at 00:00
interval=1440

# Add Python script to crontab
crontab -l > temp_cron
echo "*/$interval * * * * python3 $PYTHON_SCRIPT_PATH" >> temp_cron
crontab temp_cron
rm temp_cron

echo "Python script has been added to crontab."
