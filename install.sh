#!/bin/sh
# Installs ics2gcal for the current user and makes it the default app for .ics files.
set -e
cd "$(dirname "$0")"
install -Dm755 ics2gcal "$HOME/.local/bin/ics2gcal"
install -Dm644 ics2gcal.desktop "$HOME/.local/share/applications/ics2gcal.desktop"
sed -i "s|^Exec=.*|Exec=$HOME/.local/bin/ics2gcal %F|" "$HOME/.local/share/applications/ics2gcal.desktop"
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
xdg-mime default ics2gcal.desktop text/calendar
echo "Installed. .ics files now open with: $(xdg-mime query default text/calendar)"
