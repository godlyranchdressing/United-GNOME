#!/bin/sh

for color in '' '-dark' '-darker' ; do
	sassc -t expanded gtk-3.0/gtk${color}.scss gtk-3.0/gtk${color}.css
	done

		for color in '' '-mixed' '-light' ; do
			sassc -t expanded gnome-shell/gnome-shell${color}${size}.scss gnome-shell/gnome-shell${color}${size}.css
			
			for size in '' '-compact' ; do
				sassc -t expanded gnome-shell/gnome-shell${color}${size}.scss gnome-shell/gnome-shell${color}${size}.css
				
				for transparency in '' '-opaque' ; do
					sassc -t expanded gnome-shell/gnome-shell${color}${transparency}${size}.scss gnome-shell/gnome-shell${color}${transparency}${size}.css 
		done
	done
done
