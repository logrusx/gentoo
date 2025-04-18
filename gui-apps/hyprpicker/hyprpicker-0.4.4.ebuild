# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A wlroots-compatible Wayland color picker that does not suck"
HOMEPAGE="https://github.com/hyprwm/hyprpicker"
SRC_URI="https://github.com/hyprwm/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/wayland
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	>=gui-libs/hyprutils-0.2.0:=
"
DEPEND="virtual/pkgconfig"

BDEPEND="
	${RDEPEND}
	dev-libs/wayland-protocols
	>=dev-util/hyprwayland-scanner-0.4.0
	media-libs/libglvnd
	media-libs/libjpeg-turbo
"
