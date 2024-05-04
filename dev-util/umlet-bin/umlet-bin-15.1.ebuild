# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

DESCRIPTION="Free UML Tool for Fast UML Diagrams"
HOMEPAGE="https://www.umlet.com"
SRC_URI="https://www.umlet.com/download/umlet_$(ver_rs 1- '_')/umlet-standalone-${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-arch/unzip"
RDEPEND=">virtual/jre-1.8"

APP_NAME="Umlet"
S=${WORKDIR}/${APP_NAME}
INSTALL_PATH="/opt/${APP_NAME}"
APP_JAR="umlet.jar"

src_install() {

	newicon "${S}/img/umlet_logo.png" "${APP_NAME}.png"
	make_desktop_entry "java -Dsun.java2d.xrender=f -jar ${INSTALL_PATH}/${APP_JAR}" "${APP_NAME}" "${APP_NAME}" "Development"


	insinto $INSTALL_PATH
	doins $APP_JAR

	doins -r custom_elements img lib palettes
}
