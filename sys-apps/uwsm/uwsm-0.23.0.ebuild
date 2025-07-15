# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Universal Wayland Session Manager"
HOMEPAGE="https://github.com/Vladimir-csp/uwsm"
SRC_URI="https://github.com/Vladimir-csp/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dbus-broker +uwsm-app"

DEPEND="
		dev-python/pydbus
		dev-python/pyxdg
		sys-apps/dbus
		dbus-broker? ( sys-apps/dbus-broker )
		app-text/scdoc
	"
RDEPEND="${DEPEND}
		>=dev-lang/python-3.10
	"
BDEPEND="
		virtual/pkgconfig
	"

src_configure() {
	local emesonargs=(
		$(meson_feature uwsm-app uwsm-app)
	)
	meson_src_configure
}

src_install() {
	meson_src_install
	dodoc -r ${ED}/usr/share/doc/uwsm
	rm -rf ${ED}/usr/share/doc/uwsm
}
