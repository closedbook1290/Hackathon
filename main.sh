#!/bin/bash
#
echo "Welcome To Malware Forensics Script"

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
}

persistence_technique 
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

