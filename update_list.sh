# Creates a list of installed packages

PACMAN_PACKAGE_LIST="pacman.package_list"

pacman -Qqn > $PACMAN_PACKAGE_LIST
