# UNITED Gnome Login gnome shell theme

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

* Installer is made only for Ubuntu flavor currently as there is no other flavored login themes available. 
* This can be changed easily ones there is more login themes available. But until then there is no point to the wizard
to ask more questions.
* Find file named with **must_fix_css_for_login.txt** for browse necessary changes for gnome shell css to fix certain issues 
caused by gnome-shell.css to login screen. These changes are necessary to do if login gnome shell is wished to modify.

# Kown issues

* Login theme works quite well. Altough there are couple of unresolved issues in login screen calendar. All the information cannot fit 
perfectly. However this is minor thing though. It might be cause of some css styles that does not take effect in login screen and is taking 
effect when desktop is opened.
* Opensuse login theme will cause boot error! Do not use until some issues related to gnome shell is fixed.
