# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson toolchain-funcs

DESCRIPTION="A dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
HOMEPAGE="https://github.com/hyprwm/Hyprland"

SRC_URI="https://github.com/hyprwm/${PN^}/releases/download/v${PV}/source-v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-source"

# It turns out 0.47.1 suffers from numerous bugs
KEYWORDS="~amd64"

LICENSE="BSD"
SLOT="0"
IUSE="X legacy-renderer +qtutils systemd hyprpm"

# hyprpm (hyprland plugin manager) requires the dependencies at runtime
# so that it can clone, compile and install plugins.
HYPRPM_RDEPEND="
	app-alternatives/ninja
	>=dev-build/cmake-3.30
	dev-build/meson
	dev-vcs/git
	virtual/pkgconfig
"
RDEPEND="
	hyprpm? ( ${HYPRPM_RDEPEND} )
	dev-libs/glaze
	dev-libs/glib:2
	dev-libs/hyprlang
	dev-libs/libinput:=
	dev-libs/hyprgraphics
	dev-libs/re2:=
	>=dev-libs/wayland-1.22.90
	>=gui-libs/aquamarine-0.7.1
	>=gui-libs/hyprcursor-0.1.9
	>=gui-libs/hyprutils-0.5.0:=
	media-libs/libglvnd
	media-libs/mesa
	sys-apps/util-linux
	x11-libs/cairo
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/pixman
	x11-libs/libXcursor
	qtutils? ( gui-libs/hyprland-qtutils )
	X? (
		x11-libs/libxcb:0=
		x11-base/xwayland
		x11-libs/xcb-util-errors
		x11-libs/xcb-util-wm
	)
"
DEPEND="
	${RDEPEND}
	>=dev-libs/hyprland-protocols-0.4
	>=dev-libs/wayland-protocols-1.36
"
BDEPEND="
	hyprpm? ( dev-libs/glaze )
	|| ( >=sys-devel/gcc-14:* >=llvm-core/clang-18:* )
	app-misc/jq
	dev-build/cmake
	>=dev-util/hyprwayland-scanner-0.3.10
	virtual/pkgconfig
"

pkg_setup() {
	[[ ${MERGE_TYPE} == binary ]] && return

	if tc-is-gcc && ver_test $(gcc-version) -lt 14 ; then
		eerror "Hyprland requires >=sys-devel/gcc-14 to build"
		eerror "Please upgrade GCC: emerge -v1 sys-devel/gcc"
		die "GCC version is too old to compile Hyprland!"
	elif tc-is-clang && ver_test $(clang-version) -lt 18 ; then
		eerror "Hyprland requires >=llvm-core/clang-18 to build"
		eerror "Please upgrade Clang: emerge -v1 llvm-core/clang"
		die "Clang version is too old to compile Hyprland!"
	fi
}

src_configure() {
	local emesonargs=(
		$(meson_feature legacy-renderer legacy_renderer)
		$(meson_feature systemd)
		$(meson_feature X xwayland)
		$(meson_feature hyprpm hyprpm)
	)
	meson_src_configure
}
