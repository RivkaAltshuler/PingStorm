#!/bin/bash
script_name=$(basename "$0")
log_file="ping_results"

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

# Load domains from the file into an array
declare -a domains
while IFS= read -r domain; do
  domains+=("$domain")
done < "$domains_file"

# Loop through each domain
for domain in "${domains[@]}"; do
  ping_output=$(ping -c 1 -W 1 "$domain")
  latency_output=$(echo "$ping_output" | awk '/time=/{gsub(/time=/, ""); gsub(/ ms$/, ""); print $NF}')
  return_code=$?

  timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  echo ""  >> "$log_file"
  echo -n "$timestamp " >> "$log_file"
  echo -n "$script_name " >> "$log_file"
  echo -n "$domain " >> "$log_file"

  if [[ $return_code -eq 0 ]]; then
    echo -n "$latency_output" >> "$log_file"
  fi

done

