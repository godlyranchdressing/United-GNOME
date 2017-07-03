A roadmap/todo file for contributors and anyone curious. Also technically functions as a known issues list.

----------
# Shell
- OSD border asset needs to be tidied up a bit.

# GTK2/3
- New window button assets?

# Metacity
- Figure out how to work this.

# SCSS cleanup + Compact variant
- Use extend, loops and mixin magic to reduce the amount of semi-repeated styling. Repeated dimensions can be converted into variables that'll be affected by a new compact variable in the main SASS files that can let people with smaller displays save some screen real estate. This also leads into using **em instead of px units to better support HiDPI displays**. (I don't have one to test this out myself, unfortunately)

# Login theme
- The styling for the login dialog is untested but how to go about testing it without doing the whole compile into a gresource file isn't clear. I'm not sure how it happened to begin with, but on UG 17.04, a theme's login styling worked for the logged in user's lock screen but I can't seem to get that behavior working again.

# Epiphany Incognito Mode
- Right now it follows Adwaita's styling, but customizing it doesn't _seem_ to be possible.
