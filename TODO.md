# Curved window corners
Black background behind curved corners after a window is maximized and restored. Disappears when focus is shifted to another window.

GTK2 apps only have their headerbars curved

Elements that relied on the slider-horz-scale-has-marks-above assets need to be changed. cursor-handle is the biggest priority. While scales have a very lazy all-CSS pick that people might find ugly.

Drawing.scss should be used instead of having button rules all over the place.
