# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.28"
VALA_USE_DEPEND="vapigen"

inherit plocale gnome2 vala meson

DESCRIPTION="A Pomodoro timer for Gnome"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI="https://github.com/codito/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	 >=dev-libs/glib-2.38.0:2
	 >=x11-libs/gtk+-3.20:3
	 >=gnome-base/gnome-shell-3.38
	 x11-libs/gdk-pixbuf:2
	 >=dev-libs/gobject-introspection-1.10.0
	 >=dev-libs/libpeas-1.5.0
	 >=dev-libs/gom-0.3
	 >=media-libs/gstreamer-1.0.10:1.0
	 >=media-libs/libcanberra-0.30
	 dev-db/sqlite:3
	 x11-libs/cairo"
DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
	virtual/pkgconfig"

src_prepare() {
	vala_src_prepare
	gnome2_src_prepare
}

src_configure(){
	meson_src_configure
}

src_compile(){
	meson_src_compile
}

src_install(){
	meson_src_install
}
