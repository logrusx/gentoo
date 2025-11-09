# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION=${VALA_MIN_API_VERSION:-0.56}
PYTHON_COMPAT=( python3_{12..14} )

inherit meson vala gnome2-utils python-any-r1

MY_PN="SwayNotificationCenter"
DESCRIPTION="A simple notification daemon with a GTK gui for notifications and control center"
HOMEPAGE="https://github.com/ErikReider/SwayNotificationCenter"
SRC_URI="https://github.com/ErikReider/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pulseaudio libnotify"

DEPEND="
	dev-libs/glib:2
	dev-lang/sassc
	dev-util/blueprint-compiler
	dev-libs/gobject-introspection
	>=dev-libs/granite-7.5:=
	>=dev-libs/json-glib-1.0
	>=dev-libs/libgee-0.20.6:0.8=
	>=dev-libs/wayland-1.23.0
	>=gui-libs/gtk-4.16.13[introspection,wayland]
	>=gui-libs/gtk4-layer-shell-1.0.4[introspection,vala]
	sys-apps/dbus
	dev-util/wayland-scanner
	>=gui-libs/libadwaita-1.6.1
	pulseaudio? ( media-libs/libpulse )
	libnotify? ( x11-libs/libnotify )
	dev-vcs/git
"
RDEPEND="
	${DEPEND}
	sys-apps/systemd
"

BDEPEND="
	${PYTHON_DEPS}
	$(vala_depend)
	>=app-text/scdoc-1.9.2
"

BUILD_DIR="${S}/build"

src_configure() {
	local emesonargs=($(meson_use pulseaudio pulse-audio))
	meson_src_configure
}

src_prepare() {
	default
	vala_setup
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
