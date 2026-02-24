#!/usr/bin/env bash

echo "Removing AndroidMount..."

rm -f ~/.local/bin/androidmount
rm -f ~/.config/rofi/scripts/androidmount-menu.sh
rm -f ~/.config/polybar/modules/androidmount.ini

echo "Removed."