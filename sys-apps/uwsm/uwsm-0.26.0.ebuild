# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
inherit meson python-single-r1

DESCRIPTION="Universal Wayland Session Manager"
HOMEPAGE="https://github.com/Vladimir-csp/uwsm"
SRC_URI="https://github.com/Vladimir-csp/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dbus-broker +uwsm-app"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
		dev-python/pydbus
		dev-python/pyxdg
		sys-apps/dbus
		dbus-broker? ( sys-apps/dbus-broker )
		app-text/scdoc
	"
RDEPEND="${DEPEND}
		${PYTHON_DEPS}
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
	dodoc -r "${ED}/usr/share/doc/uwsm"
	rm -rf "${ED}/usr/share/doc/uwsm"
	python_fix_shebang "${ED}/usr/bin"
	python_optimize "${ED}/usr/share/${PN}"
}
