# UNITED Gnome Login gnome shell theme

## New way of installing / Install any variant you wish as login theme

* Download any theme variant binaries you wish to install
* Download and install Loginized application [https://github.com/juhaku/loginized](https://github.com/juhaku/loginized)
  * Install also __loginized-cli__ This will be asked with first start up.
* Extract downloaded theme files to __/usr/share/themes/__
  * __Note!__ These theme files are not compilied so you need to compile the ones you wish to use as login theme. Luckily this is simply by now.
* Go to theme folder you wish to install as login theme __`$ cd /usr/share/themes/any_theme/gnome-shell`__
* Compile this theme by running command in folder above __`$ loginized-cli compile . .`__ Note the two dots.
  * This will process some copy warning but there is no reason for panic, just ignore the copy error.
* After compile is completed you should be able to install the theme as login theme via __Loginized__ application. or the __loginized-cli__ if you want to use command line.

__If you notice any issues with the theme, something is off place or there is a glitch you can edit the gnome-shell.css and then recompile and reinstall the theme via above mentioned notes. Also you could take a look to [must_fix_css_for_login.txt](https://github.com/godlyranchdressing/United-GNOME/blob/master/extras/login-gnome-shell/must_fix_css_for_login.txt) for already know issues that may need to be fixed before compiling!__

## Installing

* Open your terminal and browse to folder where "gnome-shell-installer.sh" is located.
* Run the gnome-shell-installer.sh with command **./united-login-theme-installer.sh -i** or **./united-login-theme-installer.sh -i variant** Variant stands for variation of login themese. Currently working for ubuntu and fedora.
* After installer wizard is completed it will ask you to reboot your system. Reason behind this is 
that for login shell theme all the changes are taken effect only after the reboot is done. 

## Uninstalling

* Open your terminal and browse to folder where "gnome-shell-installer.sh" is located.
* Run the gnome-shell-installer.sh with command **./united-login-theme-installer.sh -u**
* After installer wizard is completed it will ask you to reboot your system. Reason behind this is 
that for login shell theme all the changes are taken effect only after the reboot is done. 

# Tips

* If you would like to use custom wallpaper just replace the original wallpaper in themes folder and run installer again. Remember use the same name.

# Need to know

* Find file named with **must_fix_css_for_login.txt** for browse necessary changes for gnome shell css to fix certain issues 
caused by gnome-shell.css to login screen. These changes are necessary to do if login gnome shell is wished to modify.

# Kown issues

* Login theme works quite well. Altough there are couple of unresolved issues in login screen calendar. All the information cannot fit 
perfectly. However this is minor thing though. It might be cause of some css styles that does not take effect in login screen and is taking 
effect when desktop is opened.
* Opensuse login theme will cause boot error! Do not use until some issues related to gnome shell is fixed.
