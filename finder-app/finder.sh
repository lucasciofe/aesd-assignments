# !/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2]; then
	echo "Usage: $0 filesdir  searchstr"
	exit 1
fi


# Assign arguments to variables

filesdir=$1
searchstr=$2


# Check if the directory exists
if [ ! -d "$filesdir" ];then
	echo "Directory $filesdir does not exist".
	exit 1
fi


# Initialize counters
file_count=0
match_count=0


# Loop through files and count matching lines
for file in "$filesdir"/*; do
	if [ -f "$file"]; then
		file_count=$((file_count + 1))
		match_count=$((match_count + $(grep -c "$searchstr" "$file")))
	fi
done

# Print the results

echo "The number of file are $file_count and the number of matching lines are $match_count"
