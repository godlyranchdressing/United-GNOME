A roadmap/todo file for contributors and anyone curious. Also technically functions as a known issues list.

----------

# Index.theme + Metacity

# SCSS cleanup
- Use extend, loops and mixin magic to reduce the amount of semi-repeated styling. Repeated dimensions can be converted into variables that'll be affected by a new compact variable in the main SASS files that can let people with smaller displays save some screen real estate. This also leads into using **em instead of px units to better support HiDPI displays**. (I don't have one to test this out myself, unfortunately)

# GTK2/3
- Make the dark theme follow Unity 8's? The dark theme is very dark and makes the Arch variant almost look like a Windows 10 theme. The current colors used in the dark theme is based more on Unity 8's dash/shell moreso than its *actual* dark theme which has a much more pleasant bluish grey color.

# Assets
- Window buttons? Unity 8's are a bit too thin and look a lot like Windows 10's. The original
concept had an encircled close button so something resembling that would be ideal. Ambiance's might be
worth experimenting with.

# Login theme
- The styling for the login dialog is untested but how to go about testing it without doing the whole compile into a gresource file isn't clear. I'm not sure how it happened to begin with, but on UG 17.04, a theme's login styling worked for the logged in user's lock screen but I can't seem to get that behavior working again.

# Epiphany Incognito Mode
- Right now it follows Adwaita's styling, but customizing it doesn't _seem_ to be possible.

# Potential Shell bugs / seemingly unfixable from my end
- Some dash to dock styling has the potential to repeatedly crash the Shell when opening apps.
- The last keyboard key touched when using the on-screen keyboard is left in the "hover" state
which misleadingly looks as if the key is stuck or input wasn't made. Might not be possible to fix at all as a the way most DEs just seem to treat the user's finger as a mouse cursor so the last key pressed has the "cursor" still on it. Maybe this is a non-issue in Wayland.
