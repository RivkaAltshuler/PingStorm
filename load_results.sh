#!/bin/bash
rm sorted_results
cat "$results_file" | sort -k 2 -n >> sorted_results

while IFS= read -r line; do
  results_array+=("$line")
done < sorted_results



last_index=$(( ${#results_array[@]} - 1 ))

first_line="${results_array[0]}"
last_line="${results_array[$last_index]}"

IFS=' ' read -r min_web min <<< "$first_line"
IFS=' ' read -r max_web max <<< "$last_line"








