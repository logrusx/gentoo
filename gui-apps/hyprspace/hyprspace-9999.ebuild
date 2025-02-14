# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson git-r3

DESCRIPTION="Workspace overview plugin for Hyprland simlar to Gnome and KDE Plasma"
HOMEPAGE="https://github.com/KZDKM/Hyprspace"
EGIT_REPO_URI="https://github.com/KZDKM/Hyprspace.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=gui-wm/hyprland-0.47"
RDEPEND="${DEPEND}
		x11-libs/pixman
		x11-libs/libdrm
"
BDEPEND="virtual/pkgconfig"

src_install() {
	insinto /usr/share/hypr/plugins
	doins ${BUILD_DIR}/libHyprspace.so
}

pkg_postinst() {
	elog "Standalone Hyprland plugins need to be loaded manually"
	elog "with 'hyprctl plugin load <absolute path>' command or"
	elog "with 'plugin <absolute path>' entry in hyprland.conf."
	elog "Alternatively use hyprpm for local user build."
}
