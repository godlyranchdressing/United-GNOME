In order of priority.

# Shell and GTK3
- Use ems instead of px

# Assets
- Window buttons?
- See just how much of Unity 8/Suru can be imported and used
- Replicate Unity 7/8's OSD elements by using new border image assets as opposed to relying on box shadows which don't really stand out much

# Shell
- Make the show apps icon blend in more if not using a dash extension -> maybe drop completely if DtD isn't enabled

# Compact GTK3 Variant
- Make a compact version.

# Login theme
- The styling for the login dialog is untested but I need to find a way to actually test it outside of compiling
everything and copying it to /usr/share/gnome-shell. I'm not sure how, but on UG 17.04, the styling actually
worked for the logged in user's lock screen but I can't seem to get that behavior again.

# Epiphany Incognito Mode
- Right now it follows Adwaita's styling, but customizing it doesn't _seem_ to be possible.

# Potential Shell bugs / seemingly unfixable from my end
- Some dash to dock styling has the potential to repeatedly crash the Shell when opening apps
-  The last keyboard key touched when using the on-screen keyboard is left in the "hover" state
this misleading makes the key look like it's stuck. The on-screen keyboard doesn't seem to go
into the active state when a key is touched and just gets left on hover. Might not be possible to fix as a
cursor is basically hovering over the last area touched when using a touchscreen
