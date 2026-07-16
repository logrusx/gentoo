# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.56"
VALA_USE_DEPEND="vapigen"

inherit gnome2 vala meson xdg

MY_PN="FocusTimer"

DESCRIPTION="A Pomodoro based time management utility for Gnome"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI="https://github.com/focustimerhq/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome wayland kde xfce sni automation"

RDEPEND="
	>=dev-libs/glib-2.50.0:2
	>=gui-libs/gtk-4.18:4[wayland=]
	x11-libs/cairo
	>=media-libs/graphene-1.0
	gui-libs/libadwaita:1
	>=dev-libs/gobject-introspection-1.10.0
	dev-libs/libpeas:2=[vala]
	>=dev-libs/gom-0.5.0
	>=media-libs/gstreamer-1.0.10:1.0
	>=dev-libs/json-glib-1.6.2
	dev-db/sqlite:3
	x11-libs/pango
	wayland? ( dev-util/wayland-scanner )
	!gnome-extra/gnome-pomodoro
"
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
	emesonargs=(
			$(meson_feature gnome "plugin_gnome")
			$(meson_feature wayland "plugin_wayland")
			$(meson_feature kde "plugin_kde")
			$(meson_feature xfce "plugin_xfce")
			$(meson_feature sni "plugin_sni")
			$(meson_feature automation)
		)
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
