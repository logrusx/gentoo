# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake toolchain-funcs flag-o-matic

DESCRIPTION="A dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
HOMEPAGE="https://github.com/hyprwm/Hyprland"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGI_REPO_URI="https://github.com/hyprwm/Hyprland.git"
else
	SRC_URI="
		https://github.com/hyprwm/Hyprland/releases/download/v${PV}/source-v${PV}.tar.gz
			-> ${P}.gh.tar.gz
	"
	S="${WORKDIR}/${PN}-source"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"

IUSE="X +guiutils systemd hyprpm uwsm"

REQUIRED_USE="uwsm? ( systemd )"

# hyprctl/CMakeLists.txt
HYPRCTL_COMMON_DEPEND="
	dev-libs/re2:=
	>=gui-libs/hyprutils-0.2.4:=
	sys-apps/hyprwire:=
"

# hyprpm/CMakeLists.txt
HYPRPM_COMMON_DEPEND="
	dev-cpp/tomlplusplus:=
	>=gui-libs/hyprutils-0.7.0:=
"
HYPRPM_DEPEND="
	>=dev-cpp/glaze-6.0.0:=
"

# CMakeLists.txt
#	>=dev-libs/udis86-1.7.2
COMMON_DEPEND="
	${HYPRCTL_COMMON_DEPEND}
	hyprpm? ( ${HYPRPM_COMMON_DEPEND} )
	>=dev-libs/udis86-1.7.2
	>=gui-libs/hyprutils-0.11.0:=
	>=dev-libs/wayland-1.22.90
	>=gui-libs/aquamarine-0.9.3:=
	>=dev-libs/hyprlang-0.6.7
	>=gui-libs/hyprcursor-0.1.7
	>=dev-libs/hyprgraphics-0.1.6:=
	>=x11-libs/libxkbcommon-1.11.0
	>=dev-libs/libinput-1.28:=
	sys-apps/util-linux
	x11-libs/cairo
	x11-libs/pango
	x11-libs/pixman
	x11-libs/libXcursor
	x11-libs/libdrm
	media-libs/mesa[gbm(+)]
	dev-libs/glib:2
	dev-libs/re2:=
	dev-cpp/muParser:=
	virtual/opengl
	X? (
		>=x11-libs/libxcb-1.11.0:0=
		x11-libs/xcb-util-wm
		x11-libs/xcb-util-errors
		x11-base/xwayland
	)
"

# so that it can clone, compile and install plugins.
HYPRPM_RDEPEND="
	app-alternatives/ninja
	>=dev-build/cmake-3.30
	dev-build/meson
	dev-vcs/git
	virtual/pkgconfig
"
RDEPEND="
	${COMMON_DEPEND}
	hyprpm? ( ${HYPRPM_RDEPEND} )
	guiutils? ( gui-libs/hyprland-guiutils )
	uwsm? ( sys-apps/uwsm )
	X? (
		x11-base/xwayland
	)
"
DEPEND="
	${COMMON_DEPEND}
	hyprpm? ( ${HYPRPM_DEPEND} )
	>=dev-libs/hyprland-protocols-0.6.4
	>=dev-libs/wayland-protocols-1.45
"
BDEPEND="
	|| ( >=sys-devel/gcc-15:* >=llvm-core/clang-19:* )
	app-misc/jq
	dev-build/cmake
	dev-util/wayland-scanner
	>=dev-util/hyprwayland-scanner-0.3.10
	virtual/pkgconfig
"

pkg_pretend() {
	[[ ${MERGE_TYPE} == binary ]] && return

	tc-is-gcc && tc-check-min_ver gcc 15
	tc-is-clang && tc-check-min_ver clang 20
}

src_configure() {
	# disabled upstream due to breakage in plugins
	# https://github.com/hyprwm/Hyprland/commit/ed936430216e7aa5f6f53d22eff713f8e9ed69aca
	# https://github.com/VirtCode/hypr-dynamic-cursors/issues/98
	filter-lto

	local mycmakeargs=(
		-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON # pch: lots of problems for little gain
		-DNO_SYSTEMD:STRING=$(usex !systemd ON OFF)
		-DNO_XWAYLAND:STRING=$(usex !X ON OFF)
		-DNO_HYPRPM:STRING=$(usex !hyprpm ON OFF)
		-DNO_UWSM:STRING=$(usex !uwsm ON OFF)
	)

	if [[ ${PV} != 9999 ]]; then
		mycmakeargs+=( -DCMAKE_DISABLE_FIND_PACKAGE_Git=ON )
	fi

	cmake_src_configure
}
