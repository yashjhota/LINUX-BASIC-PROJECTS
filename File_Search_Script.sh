#!/bin/bash


# Function to search by name

search_by_name() {

    read -p "Enter Filename: " filename
    find / -type f -name "$filename" 2>/dev/null

}

# Function to search by Extension

search_by_ext() {
    read -p "Enter File extension: " ext
    echo "Searching for *$ext files..."
    
    # Count files first (faster for large searches)
    count=$(find / -type f -name "*$ext" 2>/dev/null | wc -l)
    echo "Number of files found: $count"
    
    # Optionally list them
    read -p "List all files? (y/n): " list
    if [[ "$list" == "y" ]]; then
        find / -type f -name "*$ext" 2>/dev/null
    fi
}

echo "File Search Script"
echo "1. Search by Name"
echo "2. Search by Extension"
read -p "Choose an option: " choice

case $choice in 
    1) search_by_name ;;
    2) search_by_ext ;;
    *) echo "Invalid Option" ;;
esac
