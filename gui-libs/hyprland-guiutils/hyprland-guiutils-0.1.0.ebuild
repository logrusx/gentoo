# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hyprland GUI utilities"
HOMEPAGE="https://github.com/hyprwm/hyprland-guiutils"
SRC_URI="https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-libs/hyprlang-0.6.0
	>=gui-libs/hyprutils-0.2.4:=
	>=gui-libs/hyprtoolkit-0.2.2
	x11-libs/libdrm
	x11-libs/pixman
"
RDEPEND="${DEPEND}"
