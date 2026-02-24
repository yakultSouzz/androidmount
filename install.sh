#!/usr/bin/env bash

set -e

echo "Installing AndroidMount..."

mkdir -p ~/.local/bin
mkdir -p ~/.config/rofi/scripts
mkdir -p ~/.config/polybar/modules

cp bin/androidmount ~/.local/bin/
cp rofi/androidmount-menu.sh ~/.config/rofi/scripts/
cp polybar/androidmount.ini ~/.config/polybar/modules/

chmod +x ~/.local/bin/androidmount
chmod +x ~/.config/rofi/scripts/androidmount-menu.sh

echo "Installation complete."
echo "Add ~/.local/bin to your PATH if needed."