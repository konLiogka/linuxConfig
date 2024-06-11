#!/bin/bash

# Initialize variables
name=$1
directory=$2
max_images=50

# Function to check if a URL exists
url_exists() {
  curl --output /dev/null --silent --head --fail "$1"
}

# Change to the specified directory if provided, otherwise use the current directory
if [ -z "$directory" ]; then
  directory=$(pwd)
fi

if [ -d "$directory" ]; then
  cd "$directory"
else
  echo "Directory $directory does not exist."
  exit 1
fi

# Determine the maximum number of chapters
max_chapters=0
while true; do
  chapter_url="https://images.mangafreak.me/mangas/${name}/${name}_$((max_chapters + 1))/${name}_$((max_chapters + 1))_1.jpg"
  if url_exists "$chapter_url"; then
    max_chapters=$((max_chapters + 1))
  else
    break
  fi
done

# Loop to process each chapter
for i in $(seq 1 $max_chapters); do

  # Create a temporary file to store the URLs for the current chapter
  temp_file="urls_chapter_${i}.txt"
  > $temp_file
  
  # Generate the URLs for the current chapter
  for j in $(seq 1 $max_images); do
    echo "https://images.mangafreak.me/mangas/${name}/${name}_${i}/${name}_${i}_${j}.jpg" >> $temp_file
  done
  
  # Use aria2c to download the images for the current chapter
  aria2c -i $temp_file
  
  # Convert images to PDF if they exist
  if ls ${name}_${i}_*.jpg 1> /dev/null 2>&1; then
    magick ${name}_${i}_*.jpg ${name}_${i}.pdf
    # Delete all jpg images for the current chapter
    rm ${name}_${i}_*.jpg
  else
    echo "No images found for chapter $i."
  fi
  
  # Remove the temporary file
  rm $temp_file
done
