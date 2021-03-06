# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit desktop python-single-r1 vcs-snapshot

MY_COMMIT="0ed9b5e4a0e1f03c83c4589cabf410cac66cd11d"

DESCRIPTION="Desktop notification integration for connman"
HOMEPAGE="https://gitlab.com/wavexx/connman-notify/"
SRC_URI="https://gitlab.com/wavexx/connman-notify/repository/${MY_COMMIT}/archive.tar.bz2 -> ${P}.tar.bz2"

EGIT_REPO_URI="https://gitlab.com/wavexx/connman-notify.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
	dev-python/notify-python[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/pygobject:2[${PYTHON_USEDEP}]
	net-misc/connman
	virtual/notification-daemon"

src_install() {
	python_fix_shebang ${PN}
	dobin ${PN}
	dodoc README.rst

	make_desktop_entry ${PN} ${PN} ${PN} Network
}
