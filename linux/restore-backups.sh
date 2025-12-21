#!/usr/bin/env bash

# Restore backups of /usr/share/X11/xkb/rules/evdev.xml and /usr/share/X11/xkb/rules/evdev.lst
# Suffix is ".backup"

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No colour

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

print_info "Starting backup restoration..."

# Restore evdev.xml
if [ -f /usr/share/X11/xkb/rules/evdev.xml.backup ]; then
  cp /usr/share/X11/xkb/rules/evdev.xml.backup /usr/share/X11/xkb/rules/evdev.xml
  print_info "Restored evdev.xml from backup"
else
  print_warning "No backup found for evdev.xml"
fi

# Restore evdev.lst
if [ -f /usr/share/X11/xkb/rules/evdev.lst.backup ]; then
  cp /usr/share/X11/xkb/rules/evdev.lst.backup /usr/share/X11/xkb/rules/evdev.lst
  print_info "Restored evdev.lst from backup"
else
  print_warning "No backup found for evdev.lst"
fi

# Remove layout file
if [ -f /usr/share/X11/xkb/symbols/us_pt ]; then
  rm /usr/share/X11/xkb/symbols/us_pt
  print_info "Removed us_pt layout file"
else
  print_warning "Layout file us_pt not found"
fi

print_info "Restoration completed!"