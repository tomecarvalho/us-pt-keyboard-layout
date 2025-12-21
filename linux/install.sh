#!/usr/bin/env bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running with sudo
if [ "$EUID" -ne 0 ]; then
  print_error "Please run this script with sudo"
  exit 1
fi

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LAYOUT_FILE="$SCRIPT_DIR/us_pt"

# Check if layout file exists
if [ ! -f "$LAYOUT_FILE" ]; then
  print_error "Layout file 'us_pt' not found in $SCRIPT_DIR"
  exit 1
fi

print_info "Starting US-PT keyboard layout installation..."

# Step 0: Create backups
print_info "Creating backups..."
if [ ! -f /usr/share/X11/xkb/rules/evdev.xml.backup ]; then
  cp /usr/share/X11/xkb/rules/evdev.xml /usr/share/X11/xkb/rules/evdev.xml.backup
  print_info "Created backup: evdev.xml.backup"
else
  print_warning "Backup already exists: evdev.xml.backup"
fi

if [ ! -f /usr/share/X11/xkb/rules/evdev.lst.backup ]; then
  cp /usr/share/X11/xkb/rules/evdev.lst /usr/share/X11/xkb/rules/evdev.lst.backup
  print_info "Created backup: evdev.lst.backup"
else
  print_warning "Backup already exists: evdev.lst.backup"
fi

# Step 1: Copy the layout file
print_info "Copying layout file..."
cp "$LAYOUT_FILE" /usr/share/X11/xkb/symbols/
chmod 644 /usr/share/X11/xkb/symbols/us_pt
print_info "Layout file copied to /usr/share/X11/xkb/symbols/us_pt"

# Step 2: Register the layout in evdev.xml
print_info "Registering layout in evdev.xml..."
XML_FILE="/usr/share/X11/xkb/rules/evdev.xml"

# Check if already registered
if grep -q "<name>us_pt</name>" "$XML_FILE"; then
  print_warning "Layout already registered in evdev.xml, skipping..."
else
  # Find the last </layoutList> tag and insert before it
  # Using perl for in-place editing with proper XML handling
  perl -i -pe 'BEGIN{undef $/;} s{(</layoutList>)}{  <layout>
      <configItem>
        <name>us_pt</name>
        <shortDescription>us_pt</shortDescription>
        <description>English (US, Portuguese-adapted superset)</description>
        <languageList>
          <iso639Id>eng</iso639Id>
          <iso639Id>por</iso639Id>
        </languageList>
      </configItem>
      <variantList/>
    </layout>
\1}s' "$XML_FILE"
  print_info "Layout registered in evdev.xml"
fi

# Step 3: Register the layout in evdev.lst
print_info "Registering layout in evdev.lst..."
LST_FILE="/usr/share/X11/xkb/rules/evdev.lst"

# Check if already registered
if grep -q "us_pt" "$LST_FILE"; then
  print_warning "Layout already registered in evdev.lst, skipping..."
else
  # Find the ! layout section and add the entry after the first empty line
  awk '
    /^! layout$/ { layout_section=1; print; next }
    layout_section && /^$/ && !inserted { 
      print "  us_pt           English (US, Portuguese-adapted superset)"
      print ""
      inserted=1
      next
    }
    { print }
  ' "$LST_FILE" > "$LST_FILE.tmp"
  mv "$LST_FILE.tmp" "$LST_FILE"
  print_info "Layout registered in evdev.lst"
fi

# Final message
print_info "Installation completed successfully!"
echo ""
print_info "You can then select 'English (US, Portuguese-adapted superset)' from your keyboard layout settings."

