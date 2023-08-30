#!/bin/bash
command -v nikto >/dev/null 2>&1 || { echo >&2 "Nikto is not installed. Please install it."; exit 1; }

if [ ! -f "target_urls.txt" ]; then
    echo "File 'target_urls.txt' not found. Please create the file and add target URLs, one URL per line."
    exit 1
fi


timestamp=$(date +"%Y%m%d%H%M%S")
report_dir="nikto_reports_$timestamp"
mkdir "$report_dir"

while IFS= read -r url; do
    echo "Scanning $url"
    report_file="$report_dir/$(echo "$url" | tr -d '/').txt"
    nikto -h "$url" -output "$report_file"
    echo "Scan completed for $url. Report saved as $report_file"
done < "target_urls.txt"

echo "All scans completed. Reports are saved in the '$report_dir' directory."
