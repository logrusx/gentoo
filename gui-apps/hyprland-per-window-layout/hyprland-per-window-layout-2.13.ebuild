# Copyright 2024 Misha Zavertkin <misha.zavertkin@mail.ru>
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	aho-corasick@1.0.1
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.4.1
	cc@1.0.79
	cfg-if@1.0.0
	dirs@5.0.1
	dirs-sys@0.4.1
	env_logger@0.10.0
	equivalent@1.0.1
	errno@0.3.1
	errno-dragonfly@0.1.2
	getrandom@0.2.11
	hashbrown@0.14.3
	hermit-abi@0.3.1
	humantime@2.1.0
	indexmap@2.1.0
	io-lifetimes@1.0.11
	is-terminal@0.4.7
	itoa@1.0.6
	lazy_static@1.4.0
	libc@0.2.152
	libredox@0.0.1
	linux-raw-sys@0.3.8
	log@0.4.18
	memchr@2.5.0
	memoffset@0.6.5
	nix@0.23.2
	option-ext@0.2.0
	proc-macro2@1.0.76
	quote@1.0.35
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex@1.8.3
	regex-syntax@0.7.2
	rustix@0.37.19
	ryu@1.0.13
	serde@1.0.163
	serde_derive@1.0.163
	serde_json@1.0.96
	serde_spanned@0.6.5
	syn@2.0.48
	termcolor@1.2.0
	thiserror@1.0.56
	thiserror-impl@1.0.56
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.21.0
	unicode-ident@1.0.9
	wasi@0.11.0+wasi-snapshot-preview1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.48.0
	winnow@0.5.33
"

inherit cargo

DESCRIPTION="Per window keyboard layout (language) for Hyprland wayland compositor"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/coffebar/hyprland-per-window-layout"
if [[ ${PV} = 9999* ]]; then
	EGIT_REPO_URI="https://github.com/coffebar/hyprland-per-window-layout.git/"
	inherit git-r3
else
	SRC_URI="https://github.com/coffebar/hyprland-per-window-layout/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}"
	KEYWORDS="~amd64"
fi

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 MIT MPL-2.0 Unicode-DFS-2016 Unlicense"
SLOT="0"

RDEPEND="
	gui-wm/hyprland
"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_unpack() {
	if [[ ${PV} = 9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}
