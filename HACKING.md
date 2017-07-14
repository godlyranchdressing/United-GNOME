Extract Compiled.tar.gz or Compiled-Compact.tar.gz. Choose any distro you want to use as the base for your
new variant, it doesn't matter. I'm going with Arch since it's the easiest to type.

# GTK2
----------
This is the arguably the hardest one to do.
The gtkrc file defines the colors to be used.
There's three files for every distro variant appended with -light, -dark and -darker
In this case there's really only two colors to be changed:

gtk-color-scheme = "selected_bg_color: #1793d1""
gtk-color-scheme = "link_color: #FF9010"

Now there's the assets.
There's the distro-assets folder which has [distro]-[light/dark]-assets.
Just open that up with a text editor. CTRL + F and replace the hex values with whichever color you want.
You're looking to replace the values you changed in the gtkrc file. So in this case it'll be #1793D1 and #FF9010.
After that, if you don't care for the green color either, then open up the common-light/dark-assets.svg file with
a text editor and change #48B259 (I think that's the value) to something else. After that, delete the .png files
in common-assets-light and common-assets-dark. As well as the .png files in whichever distro variant assets
you modified. If you changed arch's assets svg file, then delete the .png assets in arch-dark-assets and arch-light.
If you don't do this, the script will just see that the assets are already rendered and not do anything. Now run
"./render-all-assets.sh" or "bash render-all-assets.sh" in a terminal in the distro assets folder.
Then "bash render-common-assets.sh" or "./render-all-assets.sh" in the gtk-2.0 folder.

# GTK3
----------
The colors to be used are defined in gtk-3.0/sass/common-partials/_color-palette.scss, _distros.scss.
Colors are *assigned* in _colors.scss. Change the colors of the base distro to whatever you want.
After you do that, you can change which colors are used for success/progress/etc either by changing the values themselves in
_color-palette.scss, or change them directly in _colors.scss.
*After that*, There's the common-assets.svg file that uses green that needs to be changed (if you changed the green) and
the [distro]-assets.svg file in gtk-3.0/distro-assets/source-files that has the colored window buttons.
Like before, open the svg files in a text editor, find the values and change them.
Delete the already rendered .png assets and run the render-common-assets.sh script and the render-all-assets.sh script.

# GNOME-Shell
----------
The colors are dealt with the same way they were in the GTK3 theme. (gnome-shell/sass/common-partials/_color-palette.scss,
_distros.scss and _colors.scss) Change your values. Assets, thankfully, don't need to be rendered into .png files. You can just open every one individually (that doesn't mean it's going to be any easier) and change the hex values. You'll need to edit:
toggle-on.svg
checkbox.svg
checkbox-active.svg
checkbox-hover.svg
arch-launcher.svg
and then every distro-specific asset calendar-today.svg, window-close.svg, etc.

# Compiling Everything
----------
You just need to install SASS which is different for every distro. Just type in sassc and hopefully your terminal tells you
how to install it. After that, just run "bash compile.sh" or "bash compile-compact.sh" if it's the compiled-compact archive you extracted.
It should take a while, but everything should be compiled and copied. Open the updated United-Arch folder in Compiled/ and copy
whichever version you want to use into your ~/.themes folder. The United-Arch-Light will only be the light Shell theme.
