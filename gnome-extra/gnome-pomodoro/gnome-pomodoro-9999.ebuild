# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.28"
VALA_USE_DEPEND="vapigen"
EGIT_REPO_URI="https://github.com/gnome-pomodoro/gnome-pomodoro.git"
EGIT_BRANCH="master"

inherit plocale gnome2 vala meson git-r3

DESCRIPTION="A Pomodoro timer for Gnome"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI=""
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	 dev-libs/glib
	 x11-libs/gtk+
	 gnome-base/gnome-shell
	 x11-libs/gdk-pixbuf
	 dev-libs/gobject-introspection
	 dev-libs/libpeas
	 dev-libs/gom
	 media-libs/gstreamer
	 media-libs/libcanberra
	 dev-db/sqlite
	 x11-libs/cairo"
DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
	virtual/pkgconfig"

src_prepare() {
	vala_src_prepare
	gnome2_src_prepare
	xdg_environment_reset
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

pkg_postinst() {
    gnome2_schemas_update
    xdg_pkg_postinst
}

pkg_postrm() {
    gnome2_schemas_update
    xdg_pkg_postrm
}

