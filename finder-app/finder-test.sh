#!/bin/bash

# Default values
numfiles=${1:-10}
writestr=${2:-"AELD_IS_FUN"}

# Debugging prints
echo "Number of files: $numfiles"
echo "Write string: $writestr"

# Create directory
mkdir -p /tmp/aeld-data

# Debugging prints
echo "Created directory: /tmp/aeld-data"

# Read username
username=$(cat conf/username.txt)

# Debugging prints
echo "username: $username"

# Create files
for i in $(seq 1 $numfiles); do
    echo "Creating file: /tmp/aeld-data/${username}${i}.txt with content: $writestr"
    ./writer.sh /tmp/aeld-data/${username}${i}.txt "$writestr"
    if [ $? -ne 0 ]; then
        echo "Error: writer.sh failed to create file /tmp/aeld-data/${username}${i}.txt"
        exit 1
    fi
done

# Run finder.sh
output=$(./finder.sh /tmp/aeld-data "$writestr")

# Debugging prints
echo "Output from finder.sh:"
echo "$output"

# Expected output
expected_output="The number of files are $numfiles and the number of matching lines are $numfiles"

# Compare output
if [ "$output" == "$expected_output" ]; then
    echo "success"
else
    echo "error"
fi
