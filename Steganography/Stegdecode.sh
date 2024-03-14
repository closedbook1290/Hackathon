#!/bin/bash
# Check if steghide is installed
if ! command -v steghide &> /dev/null; then
    echo "Error: steghide is not installed."
    exit 1
fi
# Check if correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image_with_message> <output_message_file>"
    exit 1
fi
# Extract arguments
echo "Enter Image file "
read image_with_message
echo "Enter Output file "
read output_message_file
# Check if image with message exists
if [ ! -f "$image_with_message" ]; then
    echo "Error: Image with message '$image_with_message' not found."
    exit 1
fi
# Decode the message from the image using steghide
echo "Decoding message from the image..."
steghide extract -sf "$image_with_message" -xf "$output_message_file"
echo "Message decoded successfully into '$output_message_file'."
