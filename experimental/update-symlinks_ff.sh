#!/bin/bash
# Script to create symbolic links to files in Zotero directory

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_list.txt>"
    exit 1
fi

# File containing the list of files
FILE_LIST="$1"

# Target directory where the symbolic links will be created
TARGET_DIR="$HOME/books_symlinks"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Read the list of files from the text file, removing leading and trailing quotes, trimming whitespace, and expanding ~
mapfile -t FILE_ARRAY < <(sed 's/^"\(.*\)"$/\1/' "$FILE_LIST" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sed "s|^~|$HOME|")

# Step 1: Remove symlinks that no longer point to a file in the list
for LINK in "$TARGET_DIR"/*; do
    if [[ -L "$LINK" ]]; then
        TARGET=$(readlink "$LINK")
        if [[ ! " ${FILE_ARRAY[*]} " =~ " $TARGET " ]]; then
            echo "Removing symlink: $LINK"
            rm "$LINK"
        fi
    fi
done

# Step 2: Add new symlinks for files listed in the text file
for FILE in "${FILE_ARRAY[@]}"; do
    # Check if the file exists before creating the symlink
    if [ ! -e "$FILE" ]; then
        echo "File does not exist: $FILE"
        continue
    fi

    FILENAME=$(basename "$FILE")
    SYMLINK="$TARGET_DIR/$FILENAME"
    
    # Create a relative path from the target directory to the file
    RELATIVE_PATH=$(realpath --relative-to="$TARGET_DIR" "$FILE")

    if [[ ! -e "$SYMLINK" ]]; then
        echo "Creating symlink: $SYMLINK -> $RELATIVE_PATH"
        ln -s "$RELATIVE_PATH" "$SYMLINK"
    fi
done

echo "Symbolic links in $TARGET_DIR have been updated."
