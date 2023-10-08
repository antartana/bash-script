#!/bin/bash

input_file="input_ips.txt"

output_directory="shodan_scan_results"

mkdir -p "$output_directory"

while IFS= read -r target; do
  sanitized_target="$(echo "$target" | tr -cd '[:alnum:].-')"

  output_file="$output_directory/$sanitized_target.txt"

  nmap -sC -sV "$target" > "$output_file"

  echo "Shodan scan completed for IP: $target. Results saved to $output_file"
done < "$input_file"

echo "Finished scanning IPs with Shodan."
