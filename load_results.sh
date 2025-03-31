#!/bin/bash
rm sorted_results
cat "$results_file" | sort -k 2 -n >> sorted_results

while IFS= read -r line; do
  results_array+=("$line")
done < sorted_results



last_index=$(( ${#results_array[@]} - 1 ))
min=$(echo "${results_array[0]}" | awk '{print $2}')
max=$(echo "${results_array[$last_index]}" | awk '{print $2}')








