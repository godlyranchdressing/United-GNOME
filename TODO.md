# Curved window corners
Black background behind curved corners after a window is maximized and restored. Disappears when focus is shifted to another window. GTK2 apps also only have their headerbars curved.

# Removed a couple assets
Elements that relied on the slider-horz-scale-has-marks-above assets need to be changed. Cursor-handle is the biggest priority as its probably a rare sight but right now there's nothing where the old asset should be. Scales with marks have a very lazy all-CSS pick that people might find ugly. Slider button could probably use more visual
feedback on hover/focus and is a bit on the oversized side : adjust margin size and add transition effects

# Messy scss
Once it works is fine and all but the drawing.scss file should be used and expanded a bit instead of having button rules all over the place.

# Compact
Go full Unity 8 and make the headerbars as super thin as possible. Everything else will only be slightly reduced in size

# Visual problems?
Inactive text color for unselected pathbar buttons might be a little too light
