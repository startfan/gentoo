# These settings were set by the catalyst build script that automatically
# built this stage.
# Please consult /usr/share/portage/config/make.conf.example for a more
# detailed example.
COMMON_FLAGS="-O2 -pipe"
CFLAGS="${COMMON_FLAGS}"
CXXFLAGS="${COMMON_FLAGS}"
FCFLAGS="${COMMON_FLAGS}"
FFLAGS="${COMMON_FLAGS}"
MAKEOPTS="-j4"
# NOTE: This stage was built with the bindist Use flag enabled
PORTDIR="/usr/portage"
DISTDIR="/usr/portage/distfiles"
PKGDIR="/usr/portage/packages"

# This sets the language of build output to English.
# Please keep this setting intact when reporting bugs.
LC_MESSAGES=C

GENTOO_MIRRORS="https://mirrors.163.com/gentoo/ http://mirrors.163.com/gentoo/ https://mirrors.tuna.tsinghua.edu.cn/gentoo"
USE="-alsa -video_cards_intel -video_cards_nouveau"
