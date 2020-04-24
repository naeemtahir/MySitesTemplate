#!/bin/bash

CWD=`pwd`

set -e

# Copy new photos
cd $K/MyPhotos
photocopy.sh "$CWD/PhotoFrame" _frame -y

# Generate photos.txt with <img> tags
cd $CWD
while read line
do     
    printf "<div class=\"picture\"><img src=\"%s\"/></div>\n" "${line:2}" 
done < <(find . -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \)) > photos.txt

# Rebuild inventory.txt
cat quotes.txt photos.txt > inventory.txt
rm photos.txt

