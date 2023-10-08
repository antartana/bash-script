#!/bin/bash

input_file="input_ips.txt"
output_file="successful_ips.txt"

if [ -e "$output_file" ]; then
  rm "$output_file"
fi

while IFS= read -r ip; do
  if ping -c 1 -W 1 "$ip" > /dev/null 2>&1; then
    echo "$ip" >> "$output_file"
    echo "Ping successful for $ip"
  else
    echo "Ping failed for $ip"
  fi
done < "$input_file"

echo "Finished pinging IPs. Successful IPs saved to $output_file"
