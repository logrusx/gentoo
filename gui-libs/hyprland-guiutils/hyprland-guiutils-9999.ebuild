# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hyprland GUI utilities"
HOMEPAGE="https://github.com/hyprwm/hyprland-guiutils"

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
SLOT="0"

DEPEND="
	>=dev-libs/hyprlang-0.6.0
	>=gui-libs/hyprutils-0.10.2:=
	>=gui-libs/hyprtoolkit-0.4.0
	x11-libs/libdrm
	x11-libs/pixman
"
RDEPEND="${DEPEND}"
