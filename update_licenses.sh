#!/bin/bash

# Update README files with appropriate license badges

# MIT License directories
MIT_DIRS=(
  "./sdk"
  "./loadtest"
  "./ci"
  "./docs"
  "./diagrams"
)

# Apache 2.0 License directories
APACHE_DIRS=(
  "./core"
  "./edgekit/relay"
  "./sdk/mcp"
)

# Enterprise License directories
ENTERPRISE_DIRS=(
  "./rollup_anchor/paymaster"
  "./edgekit/workers/premium_voice"
  "./edgekit/workers/studio_llm"
  "./core/gateway/web/enterprise"
)

# Function to add MIT license badge to README
add_mit_badge() {
  local readme_file=$1
  if [ -f "$readme_file" ]; then
    # Check if badge already exists
    if ! grep -q "License: MIT" "$readme_file"; then
      # Get the first line of the file
      local first_line=$(head -n 1 "$readme_file")
      
      # If first line starts with #, add badge after it
      if [[ "$first_line" == \#* ]]; then
        sed -i "1a\\
\\
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)\\
\\
This directory is licensed under the MIT License. See \`../../LICENSE-MIT\`." "$readme_file"
      else
        # Otherwise, add title and badge
        local dir_name=$(basename $(dirname "$readme_file"))
        sed -i "1i\\
# $dir_name\\
\\
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)\\
\\
This directory is licensed under the MIT License. See \`../../LICENSE-MIT\`.\\
" "$readme_file"
      fi
      echo "Updated $readme_file with MIT license badge"
    else
      echo "MIT badge already exists in $readme_file"
    fi
  fi
}

# Function to add Apache 2.0 license badge to README
add_apache_badge() {
  local readme_file=$1
  if [ -f "$readme_file" ]; then
    # Check if badge already exists
    if ! grep -q "License: Apache" "$readme_file"; then
      # Get the first line of the file
      local first_line=$(head -n 1 "$readme_file")
      
      # If first line starts with #, add badge after it
      if [[ "$first_line" == \#* ]]; then
        sed -i "1a\\
\\
![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)\\
\\
This directory is licensed under the Apache License 2.0. See \`../../LICENSE-APACHE-2.0\`." "$readme_file"
      else
        # Otherwise, add title and badge
        local dir_name=$(basename $(dirname "$readme_file"))
        sed -i "1i\\
# $dir_name\\
\\
![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)\\
\\
This directory is licensed under the Apache License 2.0. See \`../../LICENSE-APACHE-2.0\`.\\
" "$readme_file"
      fi
      echo "Updated $readme_file with Apache license badge"
    else
      echo "Apache badge already exists in $readme_file"
    fi
  fi
}

# Function to add Enterprise license badge to README
add_enterprise_badge() {
  local readme_file=$1
  if [ -f "$readme_file" ]; then
    # Check if badge already exists
    if ! grep -q "License: Enterprise" "$readme_file"; then
      # Get the first line of the file
      local first_line=$(head -n 1 "$readme_file")
      
      # If first line starts with #, add badge after it
      if [[ "$first_line" == \#* ]]; then
        sed -i "1a\\
\\
![License: Enterprise](https://img.shields.io/badge/License-Enterprise-red.svg)\\
\\
This directory is licensed under the RenderTrust Enterprise License. See \`../../LICENSE-ENTERPRISE\`." "$readme_file"
      else
        # Otherwise, add title and badge
        local dir_name=$(basename $(dirname "$readme_file"))
        sed -i "1i\\
# $dir_name\\
\\
![License: Enterprise](https://img.shields.io/badge/License-Enterprise-red.svg)\\
\\
This directory is licensed under the RenderTrust Enterprise License. See \`../../LICENSE-ENTERPRISE\`.\\
" "$readme_file"
      fi
      echo "Updated $readme_file with Enterprise license badge"
    else
      echo "Enterprise badge already exists in $readme_file"
    fi
  fi
}

# Process MIT directories
for dir in "${MIT_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    echo "Processing MIT directory: $dir"
    find "$dir" -name "README.md" | while read readme; do
      add_mit_badge "$readme"
    done
  fi
done

# Process Apache directories
for dir in "${APACHE_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    echo "Processing Apache directory: $dir"
    find "$dir" -name "README.md" | while read readme; do
      add_apache_badge "$readme"
    done
  fi
done

# Process Enterprise directories
for dir in "${ENTERPRISE_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    echo "Processing Enterprise directory: $dir"
    find "$dir" -name "README.md" | while read readme; do
      add_enterprise_badge "$readme"
    done
  fi
done

echo "License badge update complete!"
