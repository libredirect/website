#!/bin/sh
set -eu

# This script fetch service list to sync website and the extension.
#
# Run script
# Copy the terminal output and paste it in the correct place in index.html
# Format index.html

curl -fsSL "https://codeberg.org/LibRedirect/browser_extension/raw/branch/master/src/config.json" | jq -r '
  .services | to_entries | map (
    "\t<li>\(.value.name) <span>&#8594;</span> " +
    (.value.frontends | to_entries | map("<a href=\"\(.value.url)\">\(.value.name)</a>") | join(", ")) + "</li>"
  ) | join("\n")
'
