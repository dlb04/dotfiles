# Creates a list of installed packages

PACKAGE_LIST="package.list"

pacman -Qqe > $(PACKAGE_LIST)
