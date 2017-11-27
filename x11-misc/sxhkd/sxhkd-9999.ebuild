# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit toolchain-funcs systemd git-2

DESCRIPTION="Simple X hotkey daemon"
HOMEPAGE="https://github.com/baskerville/sxhkd/"
EGIT_REPO_URI="https://github.com/baskerville/${PN}.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

RDEPEND="x11-libs/libxcb
	x11-libs/xcb-util-keysyms"
DEPEND="${RDEPEND}
	x11-libs/xcb-util"

src_compile() {
	emake CC="$(tc-getCC)" PREFIX=/usr
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install

	if use systemd ; then
		systemd_dounit contrib/systemd/${PN}.service
	fi
}