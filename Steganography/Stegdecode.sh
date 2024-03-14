#!/bin/bash

# Function to display the main menu
show_menu() {
    echo "Advanced Steganography Tool"
    echo "1) Embed data into a file"
    echo "2) Extract data from a file"
    echo "3) Exit"
}

# Embed data function with back option
embed_data() {
    while true; do
        read -p "Enter path to the cover file (image/audio) or 'b' to go back: " cover_file
        [[ "$cover_file" == 'b' ]] && return
        if [[ ! -f "$cover_file" ]]; then
            echo "File does not exist."
            continue
        fi

        read -p "Enter path to the data file to hide or 'b' to go back: " data_file
        [[ "$data_file" == 'b' ]] && return
        if [[ ! -f "$data_file" ]]; then
            echo "Data file does not exist."
            continue
        fi

        read -sp "Enter a passphrase (hidden) or type 'b' + Enter to go back: " passphrase
        echo
        [[ "$passphrase" == 'b' ]] && return
        
        steghide embed -cf "$cover_file" -ef "$data_file" -p "$passphrase" && echo "Data has been embedded." || echo "Failed to embed data."
        break
    done
}

# Extract data function with back option
extract_data() {
    while true; do
        read -p "Enter path to the file with hidden data or 'b' to go back: " stego_file
        [[ "$stego_file" == 'b' ]] && return
        
        read -sp "Enter passphrase to extract data (hidden) or type 'b' + Enter to go back: " passphrase
        echo
        [[ "$passphrase" == 'b' ]] && return

        steghide extract -sf "$stego_file" -p "$passphrase" && echo "Data has been extracted." || echo "Failed to extract data."
        break
    done
}

# Main program loop
while true; do
    show_menu
    read -r choice

    case "$choice" in
        1) embed_data ;;
        2) extract_data ;;
	3)
	echo "Exiting..."
            exit 0;;
        *) 
            echo "Invalid choice. Please try again." ;;
    esac
    echo
done
