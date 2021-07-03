# Creates a list of installed packages

PACMAN_PACKAGE_LIST="pacman.package_list"
PIP_PACKAGE_LIST="pip.package_list"

pacman -Qqe > $PACMAN_PACKAGE_LIST
pip list | awk '{print $1}' > $PIP_PACKAGE_LIST
