#!/bin/bash

results_array=$(cat $results_file | sort -k 2 -n)


# echo "$results_array"

max=$(printf "%s\n" "${results_array[@]}" | head -n 1 | awk '{print $2}')
min=$(printf "%s\n" "${results_array[@]}" | tail -n 1 | awk '{print $2}')

# echo "$max $min"




