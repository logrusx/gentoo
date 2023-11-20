# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Utilities to test and configure joysticks, connect legacy devices to the kernel's input subsystem"

HOMEPAGE="https://sourceforge.net/projects/linuxconsole"
SRC_URI="mirror://sourceforge/${PN}-${PV}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/libsdl2
		|| (	sys-devel/gcc
				sys-devel/clang )"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake SYSTEMD_SUPPORT=1
}

src_install() {
	emake install PREFIX=${EPREFIX}/usr DESTDIR=${D}
}
