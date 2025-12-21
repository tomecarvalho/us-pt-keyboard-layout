# US-PT Keyboard Layout

A superset of the US keyboard layout created for Portuguese speakers. Unlike alternatives such as the international US layout, it retains all original keybindings of the US keyboard layout, expanding upon it exclusively through AltGr keybindings.

![Keyboard Layout](docs/layout.jpg)

## Why?

I was fed up of unwieldy shortcuts caused by my use of the Portuguese keyboard layout in programs where shortcuts were designed with the US keyboard in mind (pretty much all of them). Alternatives like the international US layout also proved unsatisfactory. Rather than strictly expanding upon the default US layout, they replace existing keybindings. Save for the fact European keyboards are usually ISO (tall Enter, key between Left Shift and Z), a user of the default US keyboard layout would be able to use this custom layout without noticing any difference.

## Choices

| Symbol(s)                   | Location                    | Reason                                                                                                                                                                         |
| --------------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `£`                         | `AltGr` + `3`               | Same as PT layout                                                                                                                                                              |
| `€`                         | `AltGr` + `5`               | Same as PT layout, except not also on AltGr + E                                                                                                                                |
| `Ç`                         | `AltGr` + `C`               | AltGr intuitively adds the cedilla                                                                                                                                             |
| `` ` `` and `´`             | `AltGr` + `[` and `]`       | The accents mirror each other, just like the brackets                                                                                                                          |
| `~`                         | `AltGr` + `\|`              | Tilde position on PT layout                                                                                                                                                    |
| `^`                         | `AltGr` + `'`               | Tilde already took its PT position, shifted it to the left                                                                                                                     |
| `¨`                         | `AltGr` + `;`               | Unnecessary, placed there so the ordinals can be together                                                                                                                      |
| `ª` and `º`                 | `AltGr` + `.` and `/`       | Bottom-right of the keyboard, positioned next to each other                                                                                                                    |
| `•`                         | `AltGr`+ `8`                | Asterisk (Shift+8) is often converted in some programs to bullet points, so AltGr+ 8 is an intuitive place to add the bullet point character for those that don't support that |
| `«` and `»`                 | `AltGr` + `9` and `0`       | Mirrored the same way as ( and ) on Shift+9 and 0                                                                                                                              |
| `—`                         | `AltGr` + `-`               | Em dash on the same key as other dash characters (hyphen and underscore)                                                                                                       |
| `–`                         | `AltGr` + `=`               | En dash to the right of em dash                                                                                                                                                |
| `É`                         | `AltGr` + `E`               | Acute accent shortcut for E                                                                                                                                                    |
| `Ê`                         | `AltGr` + `R`               | Circumflex accent shortcut for E (right of acute)                                                                                                                              |
| `Ú`                         | `AltGr` + `U`               | Acute accent shortcut for U                                                                                                                                                    |
| `Í`                         | `AltGr` + `I`               | Acute accent shortcut for I                                                                                                                                                    |
| `Ó`                         | `AltGr` + `O`               | Acute accent shortcut for O                                                                                                                                                    |
| `Ô`                         | `AltGr` + `P`               | Circumflex accent shortcut for O (right of acute)                                                                                                                              |
| `Õ`                         | `AltGr` + `L`               | Tilde accent shortcut for O (below acute)                                                                                                                                      |
| `Á`                         | `AltGr` + `A`               | Acute accent shortcut for A                                                                                                                                                    |
| `Â`                         | `AltGr` + `S`               | Circumflex accent shortcut for A (right of acute)                                                                                                                              |
| `Ã`                         | `AltGr` + `Z`               | Tilde accent shortcut for A (below acute)                                                                                                                                      |
| `À`                         | `AltGr` + `X`               | Grave accent shortcut for A (right of tilde)                                                                                                                                   |
| `…`                         | `AltGr` + `,`               | Ellipsis on the remaining punctuation key                                                                                                                                      |
| `Non-breaking space`        | `AltGr` + `Space`           | AltGr modifies Space to be non-breaking                                                                                                                                        |
| `Narrow non-breaking space` | `AltGr` + `Shift` + `Space` | Shift modifies non-breaking space to be narrow (great for units after numbers)                                                                                                 |

## Installation

### Linux

`sudo ./linux/install.sh` or read `./linux/INSTALL.md`.

To restore the backed-up files:  
`sudo ./linux/restore-backups.sh`

### Windows

Download the installer from the [GitHub releases](https://github.com/tomecarvalho/us-pt-keyboard-layout/releases). Alternatively, to build it yourself from the `klc` file, use [Microsoft Keyboard Layout Creator](https://www.microsoft.com/en-us/download/details.aspx?id=102134).
