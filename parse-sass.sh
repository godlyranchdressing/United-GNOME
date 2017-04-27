#!/bin/sh

for color in '' '-dark' '-darker' ; do
	sassc -t expanded src/gtk-3.0/gtk${color}.scss src/gtk-3.0/gtk${color}.css
done

	for color in '' '-mixed' '-light'; do
		sassc -t expanded src/gnome-shell/gnome-shell${color}${size}.scss src/gnome-shell/gnome-shell${color}.css
							
			for transparency in '' '-opaque' ; do
				sassc -t expanded src/gnome-shell/gnome-shell${color}${transparency}${size}.scss src/gnome-shell/gnome-shell${color}${transparency}.css 
	done
done
