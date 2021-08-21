#!/bin/sh

#==============================================================#
#=====[ FUNCTIONS
#==============================================================#
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


#==============================================================#
#=====[ LAUNCHERS
#==============================================================#
polybar -c ~/.config/polybar/bar.ini mybar &
run sxhkd -c ~/.config/sxhkd/sxhkdrc &
picom --config $HOME/.config/picom/picom.conf &
run nm-applet &
numlockx on &
blueberry-tray &
run volumeicon &
xwallpaper --zoom ~/Pictures/herakles-1366×768.jpg &

#==============================================================#
#=====[ CONFIGURATION
#==============================================================#
xsetroot -cursor_name left_ptr &
xset r rate 300 50
