#!/bin/bash

input_file="input_ips.txt"

output_directory="nuclei_scan_results"

mkdir -p "$output_directory"

while IFS= read -r target; do
  sanitized_target="$(echo "$target" | tr -cd '[:alnum:].-')"

  output_file="$output_directory/$sanitized_target.txt"

  nuclei -u "$target" > "$output_file"

  echo "Scan completed for $target. Results saved to $output_file"
done < "$input_file"

echo "Finished scanning IPs/domains."
