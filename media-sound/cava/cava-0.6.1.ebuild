# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit linux-info eutils

DESCRIPTION="Console-based Audio Visualizer for Alsa"
HOMEPAGE="https://github.com/karistav/cava"
SRC_URI="https://github.com/karlstav/cava/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pulseaudio"

DEPEND="sci-libs/fftw
		media-libs/alsa-lib
		sys-libs/ncurses
		dev-libs/iniparser
		pulseaudio? ( media-sound/pulseaudio )"

RDEPEND="${RDEPEND}"

DOCS="README.md"

pkg_setup() {
		if linux_config_exists ; then
			einfo "Checking kernel configuration at $(linux_config_path)..."
			if ! linux_chkconfig_present SND_ALOOP ; then
				ewarn 'Kernel option CONFIG_SND_ALOOP=[ym] needed but missing'
			fi
		fi
}

src_prepare() {
	rm -R iniparser/src || die
	eapply_user
	./autogen.sh || die
}

src_configure() {
	econf \
		--enable-legacy_iniparser \
		--docdir="${EPREFIX}"/usr/share/doc/"${PF}"
}

src_compile() {
	emake SYSTEM_LIBINIPARSER=1 VERSION="${PV}"
}

src_install() {
	einstalldocs
	emake DESTDIR="${D}" SYSTEM_LIBINIPARSER=1 install
}

