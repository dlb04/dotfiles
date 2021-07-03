
# Installs al pacman packages seen in PACMAN_PACKAGE_LIST
install_packages() {
	PACMAN_PACKAGE_LIST="package.list"
	if ! [ -f $(PACMAN_PACKAGE_LIST) ]; then
		echo "error: $(PACMAN_PACKAGE_LIST) doesn't not exists" 1>&2
		exit
	fi

	pacman -S --needed <(pacman -Slq | sort) <(sort $(PACMAN_PACKAGE_LIST))
}

# Symlink to qtile configuration directory
set_qtile_conf() {
	QTILE_DIR=".config/qtile"
	if ! [ -f $(QTILE_DIR) ]; then
		echo "error: $(PACMAN_PACKAGE_LIST) doesn't not exists" 1>&2
		exit
	fi

	ln -s $(QTILE_DIR) $(HOME)/.config/qtile
}

# Create .config directory
init() {
}
