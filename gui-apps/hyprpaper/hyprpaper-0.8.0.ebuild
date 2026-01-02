# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Wallpaper utility for Hyprland"
HOMEPAGE="https://github.com/hyprwm/hyprpaper"
SRC_URI="https://github.com/hyprwm/hyprpaper/archive/refs/tags/v${PV}.tar.gz -> ${PN}-{$PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
		x11-libs/cairo
		x11-libs/pango
		dev-libs/wayland
		dev-libs/hyprgraphics:=
		>=dev-libs/hyprlang-0.6.0
		>=gui-libs/hyprutils-0.2.4:=
		"

DEPEND="${RDEPEND}
		>=dev-libs/wayland-protocols-1.35
		>=gui-libs/hyprtoolkit-0.4.1
		sys-apps/hyprwire
		x11-libs/pixman
		x11-libs/libdrm
		virtual/pkgconfig
		"

PATCHES=(
	"${FILESDIR}"/hyprpaper-0.8.0-filter_debug_output.patch
	)
pkg_postinst() {
	elog "New configuration format since version 0.8.0:"
	elog "https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/#configuration"
}
