#!/bin/bash

# Ensure the wav directory exists

# Loop through L1 to L6 directories
for dir in ./data/audio/L{1..6}; do
    echo "Processing directory: $dir"
    
    # Find all .aiff files in the current directory
    find "$dir" -name "*.aiff" | while read -r aiff_file; do
        # Extract the filename without extension
        base_name=$(basename "$aiff_file" .aiff)
        
        # Convert .aiff to .wav
        ffmpeg -i "$aiff_file" -acodec pcm_s16le -ac 1 -ar 44100 "./data/audio/wav/${base_name}.wav" -y
        
        echo "Converted: $aiff_file to wav/${base_name}.wav"
    done
done

echo "Conversion complete!"