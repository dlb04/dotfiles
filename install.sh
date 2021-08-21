CONFDIR=$HOME/.config

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

	check_file $PACMAN_PACKAGE_LIST
	echo "Installing pacman packages"
	pacman -S --needed <(pacman -Slq | sort) <(sort $PACMAN_PACKAGE_LIST)
}

# Creates a symbolic link to a directory
# ln -s $1 $2
do_symlink() {
	if [ $# -lt 2 ]; then
		exit "error: Invalid use of do_symlink()" 1>&2
		exit
	fi

	origin=$1
	output=$2

	check_file $origin

	ln -s $origin $output
}

install_nvim_plugins() {
	echo "Installing Neovim plugins"

	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	NVIM_DIR=$CONFDIR/nvim
	mkdir -p $NVIM_DIR
	cp .config/nvim/init.vim $NVIM_DIR
	cp .config/nvim/coc-settings.json $NVIM_DIR

	nvim -c ':PlugInstall | :qa'
}

set_zsh_env() {
	echo "export ZDOTDIR=$CONFDIR/zsh" >> $HOME/.zshenv
	echo "ZDOTDIR = $CONFDIR/zsh"
}

# Create .config directory
init() {
	echo "Creating $CONFDIR"
	mkdir -p $CONFDIR

	set_zsh_env
}

install_configs() {
	echo "Simlinking config files"
	for entry in ./.config/*
	do
		output=$CONFDIR/$(echo $entry | sed 's/.*\///g')
		printf "%-20s -> %s\n" $entry $output
		do_symlink $entry $output
	done
}

main() {
	init
	install_packages
	install_configs
	install_nvim_plugins
}

main
