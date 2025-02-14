# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A basic power menu and shutdown screen written in gtkmm4"
HOMEPAGE="https://github.com/System64fumo/syspower"
EGIT_REPO_URI="https://github.com/System64fumo/syspower.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="uwsm"

DEPEND="gui-libs/gtk:4
		gui-libs/gtk-layer-shell
		dev-cpp/gtkmm
		dev-cpp/glibmm"
RDEPEND="${DEPEND}"
BDEPEND="uwsm? ( sys-apps/uwsm )"

src_prepare() {
	use uwsm && PATCHES+=( "${FILESDIR}"/uwsm.patch )
	default
}

src_install() {
	PREFIX=${EPREFIX}/usr LIBDIR=${PREFIX}/lib64 emake DESTDIR="${D}" install
	dodoc README.md LICENSE
}
