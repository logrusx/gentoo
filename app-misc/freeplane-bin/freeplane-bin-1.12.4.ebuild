# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

APP_NAME="freeplane"

DESCRIPTION="Java application for Mind Mapping, Knowledge and Project Management"
HOMEPAGE="https://www.freeplane.org/"
SRC_URI="https://downloads.sourceforge.net/project/${APP_NAME}/${APP_NAME}%20stable/archive/${PV}/${APP_NAME}_bin-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-doc"

S="${WORKDIR}/${APP_NAME}-${PV}"

RDEPEND=">=virtual/jre-1.8"
BDEPEND="
	app-arch/unzip"

src_prepare() {

	if ! use doc ; then
		rm -rf $S/doc/api
	fi

	default

}

src_install() {
	sed -e "/freepath=/s:=.*:=${EROOT}/opt/${APP_NAME}:" \
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
