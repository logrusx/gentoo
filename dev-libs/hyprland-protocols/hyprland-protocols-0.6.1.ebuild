# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Wayland protocol extensions for Hyprland"
HOMEPAGE="https://github.com/hyprwm/hyprland-protocols"

SRC_URI="https://github.com/hyprwm/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
KEYWORDS="~amd64"

LICENSE="BSD"
SLOT="0"

BDEPEND="
	dev-util/wayland-scanner
	virtual/pkgconfig
"
