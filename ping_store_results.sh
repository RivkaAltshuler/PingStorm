
rm $results_file


# Load domains from the file into an array
declare -a domains
while IFS= read -r domain; do
  domains+=("$domain")
done < "$domains_file"

# Loop through each domain
for domain in "${domains[@]}"; do
  ping_output=$(ping -c 1 -W 1 "$domain")
  
  average_latency=$(echo "$ping_output" | awk '/rtt min\/avg\/max\/mdev/{split($4, a, "/"); print a[2]}')

  return_code=$?

  timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  
  echo -n "$timestamp " >> "$log_file"
  echo -n "$script_name " >> "$log_file"
  echo -n "$domain " >> "$log_file"
  
  
  echo -n "$domain " >> "$results_file"

  if [[ $return_code -eq 0 ]]; then
    echo -n "$average_latency" >> "$log_file"
	echo -n "$average_latency" >> "$results_file"
  fi
  
  echo ""  >> "$results_file"
  echo ""  >> "$log_file"

done