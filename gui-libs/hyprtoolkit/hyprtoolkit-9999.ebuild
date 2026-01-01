# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A modern C++ Wayland-native GUI toolkit"
HOMEPAGE="https://github.com/hyprwm/hyprtoolkit"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hyprwm/${PN}.git"
else
	SRC_URI="
		https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}.tar.gz
			-> ${P}.gh.tar.gz
	"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0/4"

DEPEND="
	>=dev-libs/hyprlang-0.6.0
	>=dev-libs/hyprgraphics-0.3.0:=
	dev-libs/glib:2
	>=dev-libs/wayland-1.22.90
	>=gui-libs/aquamarine-0.10.0:=
	>=gui-libs/hyprutils-0.10.4:=
	dev-libs/iniparser:=
	media-libs/libglvnd
	media-libs/mesa
	x11-libs/pango
	x11-libs/cairo
	x11-libs/pixman
	x11-libs/libxkbcommon
	x11-libs/libdrm
"
RDEPEND="${DEPEND}
	>=dev-libs/wayland-protocols-1.45
	>=dev-util/hyprwayland-scanner-0.4.0
"
