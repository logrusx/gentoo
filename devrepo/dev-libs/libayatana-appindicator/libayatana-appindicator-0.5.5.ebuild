# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
VALA_USE_DEPEND="vapigen"

inherit autotools mate vala

DESCRIPTION="Ayatana Appindicator"
HOMEPAGE="https://ayatanaindicators.github.io"
SRC_URI="https://github.com/AyatanaIndicators/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

IUSE="-gtk2 -doc -test introspection vala"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/glib:2 \
	 gtk2? ( >=x11-libs/gtk+-2.18:2 ) \
	 !gtk2? ( >=x11-libs/gtk+-2.91:3 )
	 x11-libs/gtk+:2 \
	 dev-dotnet/gtk-sharp:2 \
	 >=dev-libs/libdbusmenu-12.10.3[gtk]
	 doc? ( >=dev-util/gtk-doc-1.14 ) \
	 >=dev-libs/libayatana-indicator-0.4 \
	 vala? ( $(vala_depend) \
	 dev-libs/ayatana-ido[vala] ) \
	 >=dev-libs/glib-2.10 \
	 dev-util/glib-utils \
	 doc? ( >=dev-util/gtk-doc-1.0 )"

BDEPEND=">=dev-util/pkgconfig-0.14.0 \
	 >=mate-base/mate-common-1.1 \
	 sys-devel/automake:1.11 \
	 >=sys-devel/autoconf-2.64 \
	 >=sys-devel/libtool-2.2:2"

DEPEND="${RDEPEND} \
	${BDEPEND} "

src_prepare() {
	use vala && vala_src_prepare
	default
	xdg_environment_reset
	eapply "${FILESDIR}/${PV}/${P}-fix-mono-compiler-check.patch"
	eautoreconf
}

src_configure() {
	local -x VALAC VALA_API_GEN VAPIGEN_VAPIDIR PKG_CONFIG_PATH
	use introspection && export VALA_API_GEN="${VAPIGEN}"
	local x=3
	if use gtk2;
		 then x=2
	fi
	mate_src_configure \
		$(use_enable doc gtk-doc) \
		$(use_enable test tests) \
		--with-gtk=$x \
		$(use_enable test mono-test) \
		$(use_enable introspection introspection yes)
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
