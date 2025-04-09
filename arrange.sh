#!/bin/bash

# Source directory (change if needed)
SOURCE_DIR="./SWE_2021_41_2025_1_week_6-main/files"

# Verify the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Directory '$SOURCE_DIR' not found!"
  exit 1
fi

# Check if directory is empty
if [ -z "$(ls -A "$SOURCE_DIR")" ]; then
  echo "The '$SOURCE_DIR' directory is empty."
  exit 0
fi

# Process each file
moved_count=0
for file in "$SOURCE_DIR"/*; do
  if [ -f "$file" ]; then  # Only process files (not directories)
    filename=$(basename "$file")
    first_char="${filename:0:1}"
    first_char_lower=$(echo "$first_char" | tr '[:upper:]' '[:lower:]')
    target_dir="./SWE_2021_41_2025_1_week_6-main/${first_char_lower}"

    # Create target directory if it doesn't exist
    mkdir -p "$target_dir"

    # Move the file (skip if target is same as source)
    if [ ! "$(dirname "$file")" = "$target_dir" ]; then
      mv -v "$file" "$target_dir/"
      ((moved_count++))
    fi
  fi
done

#echo "Done. Moved $moved_count files."
#echo "Created directories:"
#find "$SOURCE_DIR" -maxdepth 1 -type d ! -path "$SOURCE_DIR" | sort