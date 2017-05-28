#!/bin/bash

# Used to install / unistall UNITED Gnome login theme.
# Currently only for Ubuntu variant.

gnomeShell=/usr/share/gnome-shell
res=$gnomeShell/gnome-shell-theme.gresource

path="";

function showHelp {
    echo "Usage. united-login-installer [ -iu ] [ variant ]. E.g. united-login-installer -i
Used to install UNITED Gnome login theme. Can be also used to uninstall login themes.
 -i = Install
 -u = Uninstall
 -h | --help | ? = Help
 variant = Variation of login theme. E.g ubuntu, opensuse or fedora.";
}

function exists {
    if [ ! -d $1 ]; then echo "Directory \"$1\" does not exist, exiting" && exit 1; fi;
}

function checkStatus {
    status=$?;
    if [ "$status" -gt 0 ]; then echo "Failure in execution! Exiting with code: $status" && exit $status; fi
}

function install {
    echo "Installing $1 login theme...";
    # If back up resource is found uninstall old before. 
    if [ -f $res.bak ]; then
        uninstall;
    fi;
    variation=$1;

    exists "$gnomeShell";

    echo "Asking sudo rights to move original theme as back up.";
    echo "mv $res $res.bak";

    sudo mv $res $res.bak
    checkStatus

    echo "Checking does $variation folder exist in current directory.";
    exists "`pwd`/$variation";

    echo "Find compile command";
    compile=`which glib-compile-resources`

    test ${#compile} -eq 0 && echo "Compile command not found, exiting" && exist 1;
    echo "Compile command found: $compile...";

    cd "`pwd`/$variation";
    
    echo "Compiling gnome-shell-theme.gresource.xml...";
    $compile gnome-shell-theme.gresource.xml
    checkStatus

    echo "Copying compiled gnome shell theme to $gnomeShell";
    sudo cp gnome-shell-theme.gresource $gnomeShell;
    checkStatus

    rm -f gnome-shell-theme.gresource;
    checkStatus

    echo "Completed!";
}

function uninstall {
    test ! -f $gnomeShell/gnome-shell-theme.gresource.bak && echo "Back up file does not exists, cannot proceed unistall, exiting" && exit 1;

    echo "Uninstalling current theme and restoring previous theme...";
    echo "Asking sudo rights to restore.";
    sudo rm -f $gnomeShell/gnome-shell-theme.gresource;
    checkStatus
    
    sudo mv $res.bak $res
    checkStatus

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

    echo "Press alt + F2 and then type r to restart gnome shell. This makes login theme party available.";
}

path=`echo $0 | rev | cut -d \/ -f 2- | rev`;
if [ "$path" != "." ]; then cd $path; fi;

test ${#1} -eq 0 && showHelp && exit 1;

if [[ "$1" == "-h" || "$1" == "--help" || "$1" == "?" ]]; then showHelp && exit 1; fi;

if [[ "$1" != "-"* && "$1" != "?" ]]; then showHelp && exit 1; fi;

mode=${1:1:1};

case $mode in
    i)
        echo "Installing...";
        variant="$2";
        if [ "$variant" == "" ]; then
            while [ "$variant" == "" ]; do

            echo "What variant you would like to use?";

            read variant;
            if [ ! -d `pwd`/$variant ]; then echo "Variant `pwd`/$variant does not exist!" && variant=""; fi;

            done;
        fi;
        install $variant;
        checkStatus
        reboot;
		;;
	u)
		echo "Uninstalling...";
        uninstall;
        checkStatus
        reboot;
		break
		;;
	*)
		showHelp;
		;;
esac

exit 0;