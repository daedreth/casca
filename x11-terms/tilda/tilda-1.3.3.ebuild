# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils

DESCRIPTION="A drop down terminal, similar to the consoles found in first person shooters"
HOMEPAGE="https://github.com/lanoxx/tilda"
SRC_URI="https://github.com/lanoxx/tilda/archive/tilda-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"

IUSE=""

RDEPEND="x11-libs/vte
	>=dev-libs/glib-2.8.4
	dev-libs/confuse
	gnome-base/libglade"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	eautoreconf
	default
}
