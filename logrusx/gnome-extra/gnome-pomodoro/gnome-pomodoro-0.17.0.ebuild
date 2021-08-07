# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VALA_MIN_API_VERSION="0.26"
VALA_USE_DEPEND="vapigen"

inherit autotools gnome2 vala

DESCRIPTION="A Pomodoro timer for Gnome"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI="https://github.com/codito/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="appindicator nls static-libs"

RDEPEND=">=gnome-base/gnome-shell-3.36
	 dev-libs/appstream-glib[introspection]
	 dev-libs/dbus-glib
	 dev-libs/libpeas
	 media-libs/gst-plugins-base:1.0
	 >=x11-libs/gtk+-3.20:3
	 >=dev-libs/gom-0.3
	 >=dev-libs/glib-2.38.0:2
	 >=gnome-base/gsettings-desktop-schemas-3.20.0
	 >=dev-libs/gobject-introspection-1.10.0
	 >=dev-libs/libpeas-1.5.0
	 >=media-libs/gstreamer-1.0.10
	 >=media-libs/libcanberra-0.30
	 appindicator? ( >=dev-libs/libayatana-appindicator-0.5.3[vala] )"
DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

src_prepare() {
	eautoreconf
	default
	vala_src_prepare
}

src_configure() {
	gnome2_src_configure \
#	$(use_enable vala) \ #there's something wrong with the cofniguration script regarding vala binding
	$(use_enable nls) \
	$(use_enable static-libs static)
}

src_compile() {
	gnome2_src_compile
}

pkg_preinst() {
	gnome2_pkg_preinst
}

pkg_postinst() {
	gnome2_pkg_postinst
}

pkg_postrm() {
	gnome2_pkg_postrm
}
