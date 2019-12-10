#!/bin/sh

declare -A file_to_directory
file_to_directory+=(
    [".bashrc"]="${HOME}/"
    [".bashrc.local"]="${HOME}/"
    [".gitconfig"]="${HOME}/"
    [".gitconfig.local"]="${HOME}/"
    [".gitignore.global"]="${HOME}/"
)

for file in ${!file_to_directory[@]}; do
    if [ ! -f "${file_to_directory[${file}]}${file}" ]
    then
        echo "Creating ${file_to_directory[${file}]}${file}"
        cat ${file} > ${file_to_directory[${file}]}${file}
    fi
done

sleep 5
