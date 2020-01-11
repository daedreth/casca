# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils
DESCRIPTION="A cross-platform, terminal-based music player, audio engine, metadata indexer, and server"
HOMEPAGE="https://musikcube.com/"
SRC_URI="https://github.com/clangen/musikcube/archive/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pulseaudio"

RDEPEND="media-libs/faad2
	media-libs/libogg
	media-libs/libvorbis
	media-libs/flac
	media-libs/taglib
	media-libs/alsa-lib
	media-sound/lame
	sys-libs/ncurses
	dev-libs/boost
	dev-libs/libev
	net-misc/curl
	net-libs/libmicrohttpd
	sys-libs/zlib
	pulseaudio? ( media-sound/pulseaudio )"
DEPEND="${RDEPEND}
	dev-util/cmake"

CMAKE_IN_SOURCE_BUILD=True

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="release"
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

