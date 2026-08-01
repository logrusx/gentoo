# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A CLI tool maintained by the CNB project to support the use of buildpacks"
HOMEPAGE="https://buildpacks.io/ https://github.com/buildpacks/pack https://paketo.io"
SRC_URI="https://github.com/buildpacks/pack/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		https://localhost/pack-${PV}-vendor.tar.xz"

inherit bash-completion-r1 go-module

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	|| ( app-containers/docker
		app-containers/podman )
"
BDEPEND="${BDEPEND}
	>=dev-lang/go-1.25.12
"

src_compile() {
	ego build
}

src_install() {
	dobin ${PN}

	dobashcomp $FILESDIR/completions/${PV}/bash/pack

	insinto /usr/share/zsh/site-functions
	doins $FILESDIR/completions/${PV}/zsh/_pack

	insinto /usr/share/fish/vendor_completions.d
	doins $FILESDIR/completions/${PV}/fish/pack.fish
}
