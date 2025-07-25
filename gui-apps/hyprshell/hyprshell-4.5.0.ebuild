# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	aho-corasick@1.1.3
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.8
	anstyle@1.0.10
	anyhow@1.0.98
	ascii-canvas@3.0.0
	async-channel@2.3.1
	async-io@2.4.1
	async-lock@3.4.0
	async-net@2.0.0
	async-stream-impl@0.3.6
	async-stream@0.3.6
	async-task@4.7.1
	atomic-waker@1.1.2
	autocfg@1.4.0
	base64@0.22.1
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.9.1
	blocking@1.6.1
	bumpalo@3.17.0
	byteorder@1.5.0
	cairo-rs@0.20.10
	cairo-sys-rs@0.20.10
	calc@0.4.0
	cc@1.2.24
	cfg-expr@0.20.0
	cfg-if@1.0.0
	chrono@0.4.41
	clap@4.5.40
	clap_builder@4.5.40
	clap_derive@4.5.40
	clap_lex@0.7.4
	colorchoice@1.0.3
	concurrent-queue@2.5.0
	core-foundation-sys@0.8.7
	crossbeam-utils@0.8.21
	crunchy@0.2.3
	derive_more-impl@1.0.0
	derive_more@1.0.0
	diff@0.1.13
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dyn-clone@1.0.19
	either@1.15.0
	ena@0.14.3
	equivalent@1.0.2
	errno@0.3.12
	event-listener-strategy@0.5.4
	event-listener@5.4.0
	fastrand@2.3.0
	field-offset@0.3.6
	filetime@0.2.25
	fixedbitset@0.4.2
	fsevent-sys@4.1.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-lite@2.6.0
	futures-macro@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	fxhash@0.2.1
	gdk-pixbuf-sys@0.20.10
	gdk-pixbuf@0.20.10
	gdk4-sys@0.9.6
	gdk4@0.9.6
	getrandom@0.2.16
	gio-sys@0.20.10
	gio@0.20.11
	gl@0.14.0
	gl_generator@0.14.0
	glib-macros@0.20.10
	glib-sys@0.20.10
	glib@0.20.10
	gobject-sys@0.20.10
	graphene-rs@0.20.10
	graphene-sys@0.20.10
	gsk4-sys@0.9.6
	gsk4@0.9.6
	gtk4-layer-shell-sys@0.3.0
	gtk4-layer-shell@0.5.0
	gtk4-macros@0.9.5
	gtk4-sys@0.9.6
	gtk4@0.9.7
	hashbrown@0.15.3
	heck@0.5.0
	hermit-abi@0.5.1
	hyprland-macros@0.4.0-beta.2
	hyprland@0.4.0-beta.2
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.63
	indexmap@2.9.0
	inotify-sys@0.1.5
	inotify@0.11.0
	inquire@0.7.5
	is-terminal@0.4.16
	is_terminal_polyfill@1.70.1
	iterext@0.1.0
	itertools@0.10.5
	itoa@1.0.15
	js-sys@0.3.77
	khronos_api@3.1.0
	kqueue-sys@1.0.4
	kqueue@1.1.1
	lalrpop-util@0.19.12
	lalrpop@0.19.12
	lazy_static@1.5.0
	libc@0.2.174
	libredox@0.0.2
	libredox@0.1.3
	linux-raw-sys@0.9.4
	lock_api@0.4.13
	log@0.4.27
	matchers@0.1.0
	memchr@2.7.4
	memoffset@0.9.1
	mio@1.0.4
	new_debug_unreachable@1.0.6
	newline-converter@0.3.0
	notify-types@2.0.0
	notify@8.0.0
	nu-ansi-term@0.46.0
	num-runtime-fmt@0.1.2
	num-traits@0.2.19
	numtoa@0.1.0
	once_cell@1.21.3
	once_cell_polyfill@1.70.1
	overload@0.1.1
	pango-sys@0.20.10
	pango@0.20.10
	parking@2.2.1
	parking_lot@0.12.4
	parking_lot_core@0.9.11
	paste@1.0.15
	petgraph@0.6.5
	phf@0.11.3
	phf_generator@0.11.3
	phf_macros@0.11.3
	phf_shared@0.11.3
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	piper@0.2.4
	pkg-config@0.3.32
	polling@3.8.0
	precomputed-hash@0.1.1
	proc-macro-crate@3.3.0
	proc-macro2@1.0.95
	quote@1.0.40
	rand@0.8.5
	rand_core@0.6.4
	redox_syscall@0.4.1
	redox_syscall@0.5.12
	redox_termios@0.1.3
	redox_users@0.4.6
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	ron@0.10.1
	rustc_version@0.4.1
	rustix@1.0.7
	rustversion@1.0.21
	ryu@1.0.20
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.26
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.140
	serde_repr@0.1.20
	serde_spanned@0.6.9
	sharded-slab@0.1.7
	shlex@1.3.0
	siphasher@1.0.1
	slab@0.4.9
	smallvec@1.15.0
	smart-default@0.7.1
	string_cache@0.8.9
	strsim@0.11.1
	syn@2.0.101
	system-deps@7.0.5
	target-lexicon@0.13.2
	term@0.7.0
	termion@2.0.3
	thiserror-impl@1.0.69
	thiserror@1.0.69
	thread_local@1.1.8
	tiny-keccak@2.0.2
	toml@0.8.23
	toml_datetime@0.6.11
	toml_edit@0.22.27
	toml_write@0.1.2
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-subscriber@0.3.19
	tracing@0.1.41
	unicode-ident@1.0.18
	unicode-segmentation@1.12.0
	unicode-width@0.1.14
	unicode-xid@0.2.6
	utf8parse@0.2.2
	version-compare@0.2.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.61.2
	windows-implement@0.60.0
	windows-interface@0.59.1
	windows-link@0.1.1
	windows-result@0.3.4
	windows-strings@0.4.2
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.7.10
	xml-rs@0.8.26
"

inherit cargo

DESCRIPTION="A modern GTK4-based window switcher and application launcher for Hyprland"

HOMEPAGE="https://github.com/h3rmt/hyprshell/"
SRC_URI="
	https://github.com/H3rmt/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
	"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions CC0-1.0 GPL-3 GPL-3+ ISC
	MIT Unicode-3.0
"
SLOT="0"
KEYWORDS="~amd64"


# https://github.com/H3rmt/hyprswitch/issues/33
DEPEND="
	>=gui-libs/gtk4-layer-shell-1.1.1
	gui-libs/gtk:4
"

RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

# QA_FLAGS_IGNORED="usr/bin/${PN}"

# src_configure() {
# 	cargo_src_configure --no-default-features
# }
