# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Extremely fast, in memory, JSON and interface library for modern C++"
HOMEPAGE="https://github.com/stephenberry/glaze"
SRC_URI="https://github.com/stephenberry/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

inherit cmake

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-Dglaze_DEVELOPER_MODE=OFF
		)
	cmake_src_configure
}
