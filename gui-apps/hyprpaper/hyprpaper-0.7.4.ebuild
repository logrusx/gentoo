# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Wallpaper utility for Hyprland"
HOMEPAGE="https://github.com/hyprwm/${PN}"
SRC_URI="https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="BSD-3-clause"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		>=dev-util/hyprwayland-scanner-0.4.0
		x11-libs/cairo
		x11-libs/pango
		dev-libs/wayland
		dev-libs/wayland-protocols
		dev-libs/hyprgraphics
		>=dev-libs/hyprlang-0.6.0
		>=gui-libs/hyprutils-0.2.4:=
		virtual/pkgconfig
		"

RDEPEND="${DEPEND}"
BDEPEND=""
