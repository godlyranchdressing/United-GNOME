# GTK 3
 - Go over tool buttons. The spacing and states for tool buttons might not be ideal. Inkscape has switched over to GTK3 so it's the perfect guinea pig.

# Assets
- Either pretty up the CSS-only GTK3 assets or go back to external/png assets.
- Possibly make the assets resemble Unity 8's a bit more.
- The different states for a couple external assets seem to have some size inconsistencies between them. At least for the checkbox assets.
- The border color for check/radio boxes might not provide enough    contrast. Making the border the same shade as the foreground color    might be the safest option.


# Shell
- Dash to Dock's indicators need to be hijacked to give the dock indicators an off option. This would also mean changing them from the current teeth indicators. Unity 8's indicators would fit in nicely.
- Focus states can be misleading i.e: The last keyboard key touched when using the on-screen keyboard is left as "focused" but that just makes it look as though the key is just stuck.
-  Take a look at _linked_ notification quick-action buttons.
- Some change seems to have removed the box-shadow highlight from notification banners.
-  Double-check light and non-transparent variants for proper contrast
- Do something about the switch asset. It doesn't fit in
-  Tidy extensions.scss

# SCSS
- Get rid of unused variables.

# Compact GTK3 Variant
- Go full Unity 8 and make the headerbars as super thin as possible. Everything else will only be slightly reduced in size.

# Epiphany Incognito Mode
- Right now it follows Adwaita's styling, but customizing it doesn't _seem_ to be possible.
