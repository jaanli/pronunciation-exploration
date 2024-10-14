#!/bin/bash

for file in ./data/HSK/L*.txt; do
    level=${file##*/L}; level=${level%.txt}
    mkdir -p "./data/audio/L$level"
    
    while IFS=$'\t' read -r word _; do
        word=$(echo "$word" | tr -d '[:space:]')
        if [ -n "$word" ]; then
            echo "Processing: $word"
            say -v TingTing "$word" -o "./data/audio/L$level/${word}.aiff"
        fi
    done < "$file"
done

echo "All files processed!"