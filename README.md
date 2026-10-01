# ics2gcal

Double-click an `.ics` file on Linux → Google Calendar opens in your browser with the event prefilled → click **Save**.

No more Settings → Import & export → upload → pick calendar → import → dismiss popup → go back and look for it.

It parses the `.ics` and builds a Google Calendar "new event" link
(`calendar.google.com/calendar/render?action=TEMPLATE&...`) with the title, time, location, description and recurrence filled in.

- Single Python 3 script, standard library only (3.9+)
- Handles Outlook/Exchange invites (Windows timezone names like `W. Europe Standard Time`), IANA `TZID`s, UTC and floating times
- All-day and multi-day events, `DURATION` instead of `DTEND`, `RRULE` recurrence
- Multiple events in one file → one tab each
- Warns (desktop notification) if the file is a cancellation or can't be parsed

## Install

```sh
git clone https://github.com/odrakirmusic/ics2gcal.git
cd ics2gcal
./install.sh
```

This copies the script to `~/.local/bin/ics2gcal`, installs a `.desktop` entry and sets it as the default handler for `text/calendar`.

## Usage

Double-click any `.ics` file, or:

```sh
ics2gcal invite.ics
ics2gcal --print invite.ics   # just print the URL(s)
```

If you're signed into several Google accounts, choose which one to use:

```sh
export ICS2GCAL_ACCOUNT=you@example.com   # or an index like 1
```

## Notes

- Attendees are intentionally not copied, so saving never sends invites on your behalf.
- Descriptions are truncated to 2000 characters to stay under Google's URL length limit.

## Uninstall

```sh
rm ~/.local/bin/ics2gcal ~/.local/share/applications/ics2gcal.desktop
```
