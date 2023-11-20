# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Makes CAPSLOCK CTRL when key-chording and ESC when pressed alone"
HOMEPAGE="https://gitlab.com/interception/linux/plugins/caps2esc"
SRC_URI="https://gitlab.com/interception/linux/plugins/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"

inherit cmake

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-apps/interception-tools"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-v${PV}"
CMAKE_BUILD_TYPE="Release"
