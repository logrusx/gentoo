# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate autotools vala

DESCRIPTION="Ayatana Application Indicators Shared Library"
HOMEPAGE="https://ayatanaindicators.github.io"
SRC_URI="https://github.com/AyatanaIndicators/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-gtk2 -test"

RDEPEND=">=dev-libs/glib-2.37 \
	 gtk2? ( >=x11-libs/gtk+-2.18:2 ) \
	 !gtk2? ( >=x11-libs/gtk+-3.6:3 ) \
	 >=dev-util/ayatana-ido-0.4.0"

DEPEND="${RDEPEND} \
	virtual/pkgconfig"

src_prepare() {
	default
	xdg_environment_reset
	eautoreconf
}


src_configure() {
	local x=3
	if use gtk2;
		then x=2
	fi
	mate_src_configure \
		--disable-debug \
		--with-gtk=$x \
		$(use_enable test tests)
}

src_install() {
    mate_src_install
}

pkg_preinst() {
    mate_pkg_preinst
}

pkg_postinst() {
    mate_pkg_postinst
}

pkg_postrm() {
    mate_pkg_postrm
}
