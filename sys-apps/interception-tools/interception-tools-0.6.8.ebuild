# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd cmake

DESCRIPTION="A small set of utilities for operating on input events of evdev devices"
HOMEPAGE="https://gitlab.com/interception/linux/tools"
SRC_URI="https://gitlab.com/interception/linux/tools/-/archive/v${PV}/tools-v${PV}.tar.bz2"

S="${WORKDIR}/tools-v${PV}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/libudev:=
		dev-libs/libevdev
		dev-cpp/yaml-cpp:="
RDEPEND="${DEPEND}"
BDEPEND="dev-libs/boost
		virtual/libc"

CMAKE_BUILD_TYPE="Release"

src_install() {
	cmake_src_install
	systemd_dounit udevmon.service
	doinitd udevmon.init
}
