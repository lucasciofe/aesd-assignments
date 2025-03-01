#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 writefile writestr"
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Create directory if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the string to the file
echo "$writestr" > "$writefile"

# Confirm the file was written
if [ $? -eq 0 ]; then
    echo "Successfully wrote to $writefile"
else
    echo "Failed to write to $writefile"
    exit 1
fi
