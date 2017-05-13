#!/bin/bash

# Used to install / unistall UNITED Gnome login theme.
# Currently only for Ubuntu variant.

gnomeShell=/usr/share/gnome-shell
res=$gnomeShell/gnome-shell-theme.gresource

function showHelp {
    echo "Usage. united-login-installer [ -iu ]. E.g. united-login-installer -i
Used to install UNITED Gnome login theme. Can be also used to uninstall login themes.
 -i = Install
 -u = Uninstall
 -h | --help | ? = Help";
}

function exists {
    if [ ! -d $1 ]; then echo "Directory \"$1\" does not exist, exiting" && exit 1; fi;
}


function install {
    variation=$1;

    exists "$gnomeShell";

    echo "Asking sudo rights to move original theme as back up.";
    echo "mv $res $res.bak";

    sudo mv $res $res.bak 

    echo "Checking does $variation folder exist in current directory.";
    exists "`pwd`/$variation";

    echo "Find compile command";
    compile=`which glib-compile-resources`

    test ${#compile} -eq 0 && echo "Compile command not found, exiting" && exist 1;
    echo "Compile command found: $compile...";

    cd "`pwd`/$variation";
    
    echo "Compiling gnome-shell-theme.gresource.xml...";
    $compile gnome-shell-theme.gresource.xml

    echo "Copying compiled gnome shell theme to $gnomeShell";
    sudo cp gnome-shell-theme.gresource $gnomeShell;

    rm -f gnome-shell-theme.gresource;

    echo "Completed!";
}

function uninstall {
    test ! -f $gnomeShell/gnome-shell-theme.gresource.bak && echo "Back up file does not exists, cannot proceed unistall, exiting" && exit 1;

    echo "Uninstalling current theme and restoring previous theme...";
    echo "Asking sudo rights to restore.";
    sudo rm -f $gnomeShell/gnome-shell-theme.gresource;
    sudo mv $res.bak $res

    echo "Completed!";
}

function reboot {
    echo "Do you wish to reboot now, changes take affect after reboot? (y/N)";
    read allowReboot;
    if [ "$allowReboot" == "y" ]; then
        rebootCommand=`which reboot`;
        test ${#rebootCommand} -eq 0 && echo "Reboot command not found, exiting" && exist 1;
        
        echo "Reboot command found: $rebootCommand";

        sudo $rebootCommand now;
    fi;
}

test ${#1} -eq 0 && showHelp && exit 1;

if [[ "$1" == "-h" || "$1" == "--help" || "$i" == "?" ]]; then showHelp && exit 1; fi;

if [[ "$1" != "-"* && "$1" != "?" ]]; then showHelp && exit 1; fi;

mode=${1:1:1};

case $mode in
    i)
        echo "Installing...";
        install "ubuntu";
        reboot;
		;;
	u)
		echo "Uninstalling...";
        uninstall;
        reboot;
		break
		;;
	*)
		showHelp;
		;;
esac

exit 0;