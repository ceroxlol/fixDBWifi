# Fix DieBahn wifi
Bash script to reset the bridge which creates a conflict upon connecting a second time to the wifi provided on trains with Deutsche Bahn.

# What to do?
Give the script execution rights ( {chmod +x}) and execute it via
{sudo ./fix_db_wifi.sh}. The script needs root as ifconfig and brctl need root rights.

After you have executed the script, reconnect to the wifi (WIFI@DB) and you should be prompted to the hotspot login.
