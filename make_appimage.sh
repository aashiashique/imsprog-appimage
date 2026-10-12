#!/bin/sh

set -eu

ARCH="$(uname -m)"
SHARUN="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/quick-sharun.sh"
EXTRA_PACKAGES="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/get-debloated-pkgs.sh"
VERSION=1.9.1

export ARCH
export OUTPATH=./dist
export ADD_HOOKS="udev-installer.hook"
export ICON=/usr/share/pixmaps/IMSProg64.png
export DESKTOP=/usr/share/applications/IMSProg.desktop
export MAIN_BIN=IMSProg
export OUTNAME=IMSProg-v"$VERSION"_"$ARCH".AppImage
export APPNAME=IMSProg
export VERSION

pacman -Syu --noconfirm \
  	base-devel       \
  	git              \
  	kvantum          \
  	libxcb           \
  	libxcursor       \
  	libxi            \
  	libxkbcommon     \
  	libxkbcommon-x11 \
  	libxrandr        \
  	libxtst          \
  	lxqt-qtplugin    \
  	patchelf         \
  	qt6ct            \
  	qt6-tools        \
  	wget             \
  	xorg-server-xvfb
  	
mkdir -p ./AppDir/etc/udev/rules.d

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
wget --retry-connrefused --tries=30 "$EXTRA_PACKAGES" -O ./get-debloated-pkgs.sh
chmod +x ./get-debloated-pkgs.sh
./get-debloated-pkgs.sh --add-common --prefer-nano

echo "Bundling AppImage..."
echo "---------------------------------------------------------------"
wget --retry-connrefused --tries=30 "$SHARUN" -O ./quick-sharun
chmod +x ./quick-sharun
./quick-sharun \
	/usr/bin/IMSProg					\
	/usr/bin/IMSProg_database_update	\
	/usr/bin/IMSProg_editor	
	
# Copy udev rules
cp /lib/udev/rules.d/71-CH341.rules ./AppDir/etc/udev/rules.d/71-CH341.rules

./quick-sharun --make-appimage

# test the final app
./quick-sharun --test ./dist/*.AppImage

