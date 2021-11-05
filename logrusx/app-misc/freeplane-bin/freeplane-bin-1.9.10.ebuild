# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

JAVA_PKG_IUSE="doc"

VIRTUALX_REQUIRED="test"

inherit desktop xdg

APP_NAME="freeplane"

DESCRIPTION="Java application for Mind Mapping, Knowledge and Project Management"
HOMEPAGE="https://www.freeplane.org/"
#SRC_URI="mirror://sourceforge/${APP_NAME}/${APP_NAME}%20stable/${APP_NAME}_bin-${PV}.zip"
SRC_URI="https://downloads.sourceforge.net/project/${APP_NAME}/${APP_NAME}%20stable/archive/${PV}/${APP_NAME}_bin-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${APP_NAME}-${PV}"

RDEPEND=">=virtual/jre-1.8"
DEPEND="
	app-arch/unzip"

src_install() {
	sed -e "/freepath=/s:=.*:=${EROOT}opt/${APP_NAME}:" \
		-i freeplane.sh
	newbin freeplane.sh freeplane

	# install icons
	newicon "${S}/freeplane.png" "${APP_NAME}.png"
	make_desktop_entry "${APP_NAME}" "Freeplane" "${APP_NAME}" "Education" "MimeType=application/x-mind;"

	insinto "/opt/${APP_NAME}"
	doins framework.jar freeplanelauncher.jar \
		freeplane.policy props.xargs init.xargs *.l4j.ini
	doins -r core doc plugins resources
}
