#!/bin/bash
# Network Monitoring Script

function show_help {
    echo "Usage: $0 [OPTION] [ARGUMENT]"
    echo "  -p, --ports                 Show active listening ports"
    echo "  -s, --services              List all active services"
    echo "  -t, --test [HOST/IP]        Test connectivity to a host (ping)"
    echo "  -w, --web [URL]             Retrieve web response (curl)"
    echo "  -h, --help                  Show this help"
}

if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    -p|--ports)
        echo "Active listening ports:"
        # Using ss as it is standard and fast
        ss -tuln
        ;;
    -s|--services)
        echo "Running services:"
        systemctl list-units --type=service --state=running
        ;;
    -t|--test)
        if [[ -z "$2" ]]; then echo "Missing host argument."; exit 1; fi
        echo "Pinging $2..."
        ping -c 4 "$2"
        ;;
    -w|--web)
        if [[ -z "$2" ]]; then echo "Missing URL argument."; exit 1; fi
        echo "Retrieving HTTP headers from $2..."
        curl -I "$2"
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Invalid option."
        show_help
        exit 1
        ;;
esac
