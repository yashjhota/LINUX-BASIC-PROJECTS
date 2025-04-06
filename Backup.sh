#!/bin/bash

# Define the source directory and backup directory
SOURCE_DIR="/home/jain/Desktop/Bash Scripts"                    # change it to yours both source and backup dir
BACKUP_DIR="/home/jain/Desktop/Bash Scripts/Backup"

# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create the backup
tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" "$SOURCE_DIR"



# Print a success message
echo "Backup completed successfully: $BACKUP_DIR/backup_$TIMESTAMP.tar.gz"


# Extraction

# tar -xzvf backup_file.tar.gz -C /target/directory   [extarcts to  specified directory]
# tar -xzvf backup_file.tar.gz [extarcts to Current directory]
# tar -tzvf backup_file.tar.gz [list content without extracting]
# tar -xzvf backup_file.tar.gz path/inside/archive.txt [extracting specific file.folder]


#    -x : Extract files (instead of creating an archive)

#   -z : Decompress the gzipped archive

#   -v : Verbose (show progress)

#   -f : Specify the filename

#   -C : (Optional) Extract to a different target directory
