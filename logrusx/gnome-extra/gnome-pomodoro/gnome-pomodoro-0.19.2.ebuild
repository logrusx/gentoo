# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VALA_MIN_API_VERSION="0.28"
VALA_USE_DEPEND="vapigen"

inherit autotools vala gnome2

DESCRIPTION="A Pomodoro timer for Gnome"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI="https://github.com/codito/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=gnome-base/gnome-shell-3.38
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
	 dev-util/gtk-update-icon-cache
	 dev-util/desktop-file-utils"
DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
	virtual/pkgconfig"

src_prepare() {
	eautoreconf
	gnome2_src_prepare
	vala_src_prepare
}

