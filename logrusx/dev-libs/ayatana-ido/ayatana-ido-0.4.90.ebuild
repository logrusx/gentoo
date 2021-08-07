# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
VALA_USE_DEPEND="vapigen"

inherit autotools mate vala

DESCRIPTION="Ayatana Indicator Display Objects"
HOMEPAGE="https://ayatanaindicators.github.io"
SRC_URI="https://github.com/AyatanaIndicators/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="introspection doc vala"

RDEPEND=">=dev-libs/glib-2.37 \
	 >=x11-libs/gtk+-3.8.2 \
	 >=dev-libs/libdbusmenu-12.10.3[gtk] \
	 >=mate-base/mate-common-1.1 \
	 doc? ( >=dev-util/gtk-doc-1.0 ) \
	 vala? ( $(vala_depend) ) \
	 introspection? ( >=dev-libs/gobject-introspection-0.6.7 )"

BDEPEND="virtual/pkgconfig"
DEPEND="${RDEPEND} \
	$BDEPEND"

src_prepare() {
    use vala && vala_src_prepare
    default
    xdg_environment_reset
    mate_src_prepare
}


src_configure() {
	use vala && local -x VALAC VALA_API_GEN VAPIGEN_VAPIDIR PKG_CONFIG_PATH
	use vala && export VALA_API_GEN="${VAPIGEN}"
	econf \
	$(use_enable introspection) \
	$(use_enable doc gtk-doc)
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


