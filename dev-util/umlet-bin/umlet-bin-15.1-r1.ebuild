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
MY_PN="umlet"
S=${WORKDIR}/${APP_NAME}
INSTALL_PATH="${EROOT}/opt/${PN}"
APP_JAR="umlet.jar"

src_install() {
	sed -i '/# export UMLET_HOME/,/^$/s|^$|export UMLET_HOME='"${INSTALL_PATH}"'|' umlet.sh || die
	newbin umlet.sh umlet

	newicon "${S}/img/umlet_logo.png" "${MY_PN}.png"
	make_desktop_entry "umlet" "${APP_NAME}" "${MY_PN}" "Development" "StartupWMClass=com-baselet-standalone-MainStandalone"


	insinto $INSTALL_PATH
	doins $APP_JAR

	doins -r custom_elements img lib palettes
}
