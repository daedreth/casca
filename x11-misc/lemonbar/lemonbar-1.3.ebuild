# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SRC_URI="https://github.com/LemonBoy/bar/archive/v${PV}.zip"
KEYWORDS="~amd64"
S="${WORKDIR}/bar-${PV}"

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libxcb
		>=dev-lang/perl-5"
RDEPEND="${DEPEND}"

DOCS="README.pod"

src_prepare() {
	sed -i -e 's/-Os//' Makefile || die "Sed failed"
	default
}
