#!/bin/bash

SOURCE_DIR="./SWE_2021_41_2025_1_week_6-main/files"

moved_count=0
for file in "$SOURCE_DIR"/*; do
  if [ -f "$file" ]; then  
    filename=$(basename "$file")
    first_char="${filename:0:1}"
    first_char_lower=$(echo "$first_char" | tr '[:upper:]' '[:lower:]')
    target_dir="./SWE_2021_41_2025_1_week_6-main/${first_char_lower}"

    mkdir -p "$target_dir"

    if [ ! "$(dirname "$file")" = "$target_dir" ]; then
      mv -v "$file" "$target_dir/"
      ((moved_count++))
    fi
  fi
done
