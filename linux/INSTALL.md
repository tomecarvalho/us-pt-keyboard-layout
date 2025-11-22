# Manual Installation Guide for US-PT Keyboard Layout (Linux)

## Prerequisites

Before installing, **create backups**:

```bash
sudo cp /usr/share/X11/xkb/rules/evdev.xml /usr/share/X11/xkb/rules/evdev.xml.backup
sudo cp /usr/share/X11/xkb/rules/evdev.lst /usr/share/X11/xkb/rules/evdev.lst.backup
```

## Installation Steps

### 1. Copy the Layout File

```bash
sudo cp us_pt /usr/share/X11/xkb/symbols/
sudo chmod 644 /usr/share/X11/xkb/symbols/us_pt
```

### 2. Register the Layout in evdev.xml

Edit the file:
```bash
sudo nano /usr/share/X11/xkb/rules/evdev.xml
```

Find the `</layoutList>` closing tag (near the end of the file, around line 6900+).

**Before** that closing tag, add this entry:

```xml
    <layout>
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
```

### 3. Register the Layout in evdev.lst

Edit the file:
```bash
sudo nano /usr/share/X11/xkb/rules/evdev.lst
```

Find the `! layout` section (near the beginning of the file). Add this line at the end:

```
  us_pt           English (US, Portuguese-adapted superset)
```

(Make sure there are two spaces at the beginning, matching the indentation of other entries)

### 4. Apply Changes

Log out and log back in.

## Uninstallation

### 1. Restore backups

```bash
sudo cp /usr/share/X11/xkb/rules/evdev.xml.backup /usr/share/X11/xkb/rules/evdev.xml
sudo cp /usr/share/X11/xkb/rules/evdev.lst.backup /usr/share/X11/xkb/rules/evdev.lst
sudo rm /usr/share/X11/xkb/symbols/us_pt
```

### 2. Restart

Log out and log back in.

## Troubleshooting

### If Keyboard Layouts Break

If your desktop environment's keyboard settings stop showing keyboard layouts or they appear corrupted:

1. **Restore from backup:**
```bash
sudo cp /usr/share/X11/xkb/rules/evdev.xml.backup /usr/share/X11/xkb/rules/evdev.xml
sudo cp /usr/share/X11/xkb/rules/evdev.lst.backup /usr/share/X11/xkb/rules/evdev.lst
```

2. **Fedora: Reinstall xkb data package:**
```bash
sudo dnf reinstall xkeyboard-config
```

