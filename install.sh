
# Checks if the file or directory at $1 exists, if not prints an
# error message and exits. Otherwise just returns
check_file() {
	if ! [ -f $1 ]; then
		echo "error: $1 doesn't exists" 1>&2
		exit
	fi
}

# Installs al pacman packages seen in PACMAN_PACKAGE_LIST
install_packages() {
	PACMAN_PACKAGE_LIST="package.list"
	PIP_PACKAGE_LIST="pip.package_list"

	check_file $PACMAN_PACKAGE_LIST
	check_file $PIP_PACKAGE_LIST

	echo "Installing pacman packages"
	pacman -S --needed <(pacman -Slq | sort) <(sort $PACMAN_PACKAGE_LIST)

	echo "Installing pip packages"
	pip install --user -I -r $PIP_PACKAGE_LIST
}

# Creates a symbolic link to a directory
# ln -s $1 $2
symlink_dir() {
	if [ $# -lt 2 ]; then
		exit "error: Invalid use of symlink_dir()" 1>&2
		exit
	fi

	TARGET_DIR=$1
	LINK=$2

	check_file $TARGET_DIR

	ln -s $TARGET_DIR $LINK
}

# Symlink to qtile configuration directory
set_qtile_conf() {
	symlink_dir ".config/qtile" "$HOME/.config/qtile"
}

set_zathura_conf() {
	symlink_dir ".config/zathura" "$HOME/.config/zathura"
}

set_alacritty_conf() {
	symlink_dir ".config/alacritty" "$HOME/.config/alacritty"
}

set_zsh_conf() {
	chsh -s /usr/bin/zsh
	echo 'export ZDOTDIR=$HOME/.config/zsh' > $HOME/.zshenv
	symlink_dir ".config/zsh" "$HOME/.config/zsh"
}

install_nvim_plugins() {
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	NVIM_DIR=$HOME/.config/nvim
	mkdir -p $NVIM_DIR
	cp .config/nvim/init.vim $NVIM_DIR
	cp .config/nvim/coc-settings.json $NVIM_DIR

	nvim -c ':PlugInstall'
}

# Create .config directory
init() {
	echo "Creating $HOME/.config"
	mkdir -p $HOME/.config
}

main() {
	init
	install_packages
	set_qtile_conf
	set_alacritty_conf
	set_zathura_conf
	set_zsh_conf
}
