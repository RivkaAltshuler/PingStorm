#!/bin/bash
script_name=$(basename "$0")
log_file="pingstorm.log"
results_file="results"


# Check if a domain file argument is provided
if [[ -z "$1" ]]; then
  echo "Usage: $script_name <domains_file>"
  echo "  <domains_file> is the path to the file containing domains to check (one per line)."
  exit 1
fi

domains_file="$1"

# Check if the domains file exists
if [[ ! -f "$domains_file" ]]; then
  echo "Error: Domains file '$domains_file' not found."
  exit 1
fi

source ping_store_results.sh
results_array=$(cat $results_file | sort -k 2 -n)

echo "$results_array"

