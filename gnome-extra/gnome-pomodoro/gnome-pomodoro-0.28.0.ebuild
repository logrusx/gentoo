# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.28"
VALA_USE_DEPEND="vapigen"

inherit gnome2 vala meson xdg

DESCRIPTION="A Pomodoro timer for Gnome"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI="https://github.com/codito/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome"

RDEPEND="
	>=dev-libs/glib-2.38.0:2
	>=x11-libs/gtk+-3.20:3
	gnome? ( >=gnome-base/gnome-shell-46 )
	x11-libs/gdk-pixbuf:2
	>=dev-libs/gobject-introspection-1.10.0
	dev-libs/libpeas:0=
	>=dev-libs/gom-0.3
	>=media-libs/gstreamer-1.0.10:1.0
	>=media-libs/libcanberra-0.30
	>=dev-libs/json-glib-1.6.2
	dev-db/sqlite:3
	x11-libs/cairo"
DEPEND="
	$(vala_depend)
	dev-util/intltool"
BDEPEND="
	virtual/pkgconfig"

src_prepare() {
	vala_setup
	gnome2_src_prepare
	xdg_environment_reset
}

src_configure(){
	meson_src_configure
}

src_compile(){
	meson_src_compile
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_pkg_postinst
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_pkg_postrm
}
