#!/bin/bash

echo "Welcome to Forensics and Malware Analysis Script!"

# Function to display the main menu
function display_menu() {
	echo "Select an option :"
	echo "1) Persistence Techniques for Linux"
	echo "2) Memory forensics"
	echo "3) Rootkit Detection"
	echo "4) Steganography"
	echo "5) File Analysis"
	echo "Select an option"
}
function persistence_techniques () {
	echo "Linux Persistence Techniques"
	echo "1)  Environment Variables"
	echo "2)  Locating Linux Startup scripts"
	echo "3)  Finding existing cron jobs"
	echo "4)  Mounts and Partitions"
	echo "5)  Systemd services"
	echo "6)  Persisting user data"
	echo "7)  Process Monitoring"
	echo "8)  Persistent RAM disk"
	echo "9)  Network File System"
	echo "10) Malicious Databases"
	echo "11) Malicious sysconfig files"
	echo "12) Logging and Log Rotation"
	echo "Select a option"
	cd 'Persistence Scripts'
 	read -r choice
  	case $choice in 
	1)
      		bash environmentvariables.sh
		;;
	2)
		bash startupscripts.sh
		;;
	3) 
		bash cronjobs.sh
		;;
	4)
		bash mount.sh
		;;
	5)
		bash system_services.sh
		;;
	6) 
		bash persist.sh
		;;
	7) 
		bash processmonitering.sh
		;;
	8)
		bash ramdisk.sh
		;;
	9)
		bash networkfilesystem.sh
		;;
	10)
		bash mal-database.sh
		;;
	11) 
		bash mal-sysconfig.sh
		;;
	12)
		bash Log-rotations.sh
		;;
  		
}

# Function to perform memory forensics using Volatility
function memory_forensics () {
  echo "Enter the path to the memory image: "
  read memory_image

  # Check if Volatility is installed
 # if ! command -v /volatility/volatility &> /dev/null ; then
  #  echo "Error: Volatility is not installed."
   # return 1
  #fi

  # Ask for Volatility commands from the user
  echo "Enter Volatility commands (separate them with spaces):"
  read -r volatility_commands

  # Run Volatility commands on the memory image
  # volatility -f $memory_image $volatility_commands
  cd volatility
  python2 vol.py -f $memory_image $volatility_commands
  cd ..
}

# Function to detect rootkits (replace 'rootkit_hunter' with your actual tool)
function rootkit_detection () {
  # Check if your rootkit detection tool is installed
  if ! command -v rootkit_hunter &> /dev/null ; then
    echo "Error: Rootkit detection tool (rootkit_hunter) is not installed. Replace 'rootkit_hunter' with your tool."
    return 1
  fi

  # Run your rootkit detection tool
  sudo rkhunter --check
}

# Function to scan a file for malware using VirusTotal
function scan_file () {
  echo "Enter the path to the file: "
  read file_path

  # Check if curl is installed (needed for VirusTotal API access)
  if ! command -v curl &> /dev/null ; then
    echo "Error: curl is not installed."
    return 1
  fi

  # Get the file hash
  file_hash=$(sha256sum $file_path | awk '{print $1}')

  # VirusTotal API URL (replace with your own API key)
  api_url="https://www.virustotal.com/vtapi/v3/files/$file_hash"
  api_key="YOUR_VIRUSTOTAL_API_KEY"

  # Send the request to VirusTotal API
  scan_result=$(curl -X GET -H "Authorization: Bearer $api_key" $api_url)

  # Display scan results (parse the JSON output for better presentation)
  echo "Scan Results:"
  echo "$scan_result"
}

while true; do
  display_menu
  read -r choice

  case $choice in
    1)
      persistence_techniques
      ;;
    2)
      memory_forensics
      ;;
    3)
      rootkit_detection
      ;;
    4)
      steganography
      ;;
    5)
      scan_file
      ;;
      
    6)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done




  
display_menu
	read -r choice
	
	case $choice in
		1)
			persistence_technique

	esac
done


		

#function memory_forensics () { 

#}

#fuction rootkit () {

#}

#function steganography () {

#}

#function file_analysis (){

#}

