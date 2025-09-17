# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Configure, connect and test joysticks and legacy devices"

HOMEPAGE="https://sourceforge.net/projects/linuxconsole"
SRC_URI="https://downloads.sourceforge.net/project/linuxconsole/${PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/libsdl2
		|| (	sys-devel/gcc
				llvm-core/clang )"
RDEPEND="${DEPEND}"

src_compile() {
	emake SYSTEMD_SUPPORT=1
}

src_install() {
	emake install PREFIX="${EPREFIX}"/usr DESTDIR="${D}"
}
