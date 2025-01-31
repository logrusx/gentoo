# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Output simple text to a wayland desktop widget"
HOMEPAGE="https://git.sr.ht/~proycon/wayout"
SRC_URI="https://git.sr.ht/~proycon/${PN}/archive/${PV}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"

inherit meson

DEPEND="virtual/pkgconfig"
RDEPEND="${DEPEND}
			dev-libs/wayland-protocols
			dev-libs/wayland
			x11-libs/cairo
			x11-libs/pango
		"
BDEPEND="	dev-util/wayland-scanner
			app-text/scdoc
		"
