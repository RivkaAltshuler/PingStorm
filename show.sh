#!/bin/bash

echo "Fastest: $min_web ($min ms)"
echo "Slowest: $max_web ($max ms)"
echo ""

bar_width=20
block="█"

for line in "${results_array[@]}"; do
  IFS=' ' read -ra fields <<< "$line"
  latency=${fields[1]}
  target=${fields[0]}
  
  echo -n "$target | "
  
  length=$(echo "$max - $min" | bc -l)
  bar_length=$(echo "scale=2; ($bar_width * ($latency / $length))" | bc -l)
  
  for i in $(seq 1 "$bar_length"); do
    printf "$block"
  done
  echo " $latency ms"

done
echo ""










