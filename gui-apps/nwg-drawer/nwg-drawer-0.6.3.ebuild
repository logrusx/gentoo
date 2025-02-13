# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="App launcher for Hyprland and Sway based on GTK3"
HOMEPAGE="https://github.com/nwg-piotr/nwg-drawer"
SRC_URI="https://github.com/nwg-piotr/${PN}/archive/refs/tags/v${PV}.tar.gz
https://github.com/logrusx/${PN}/releases/download/v${PV}/nwg-drawer-${PV}-vendor.tar.xz
https://github.com/logrusx/nwg-drawer/releases/download/v0.6.3/nwg-drawer-0.6.3-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-misc/xdg-utils
	x11-libs/gtk+:3
	gui-libs/gtk-layer-shell
"
RDEPEND="${DEPEND}
	"
BDEPEND=""


src_compile() {
	ego build
}

src_install() {
	insinto /usr/share/nwg-drawer
	doins -r desktop-directories
	doins -r img
	doins drawer.css
	dobin nwg-drawer
}

