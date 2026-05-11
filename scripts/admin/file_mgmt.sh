#!/bin/bash
# File and Directory Management Script

function show_help {
    echo "Usage: $0 [OPTION] [SOURCE] [DESTINATION]"
    echo "Manage files and directories."
    echo "  -c, --create     Create a file or directory (specify type as second arg: 'file' or 'dir')"
    echo "  -cp, --copy      Copy a file or directory"
    echo "  -mv, --move      Move a file or directory"
    echo "  -rm, --remove    Remove a file or directory"
    echo "  -h, --help       Show this help message"
}

if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    -c|--create)
        if [[ "$2" == "dir" ]]; then
            mkdir -p "$3"
            echo "Directory '$3' created successfully."
        elif [[ "$2" == "file" ]]; then
            touch "$3"
            echo "File '$3' created successfully."
        else
            echo "Invalid type. Use 'file' or 'dir'."
        fi
        ;;
    -cp|--copy)
        cp -r "$2" "$3"
        echo "Copied '$2' to '$3'."
        ;;
    -mv|--move)
        mv "$2" "$3"
        echo "Moved '$2' to '$3'."
        ;;
    -rm|--remove)
        rm -rf "$2"
        echo "Removed '$2'."
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Invalid option: $1"
        show_help
        exit 1
        ;;
esac
