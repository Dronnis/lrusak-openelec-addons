################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2013 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="go"
PKG_VERSION="1.5.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://golang.org"
PKG_URL="https://github.com/golang/go/archive/${PKG_NAME}${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_NAME}${PKG_VERSION}"
PKG_DEPENDS_HOST="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="system"
PKG_SHORTDESC="Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."
PKG_LONGDESC="Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAINTAINER="Lukas Rusak (lorusak@gmail.com)"

configure_host() {
  export GOOS=linux
  export GOROOT_FINAL=$ROOT/$TOOLCHAIN/lib/golang
  export GOROOT_BOOTSTRAP=/usr/lib/golang
  export GOARCH=amd64
}

make_host() {
  cd $ROOT/$PKG_BUILD/src
  bash make.bash --no-banner
}

makeinstall_host() {
  mkdir -p $ROOT/$TOOLCHAIN/lib/golang
  cp -av $ROOT/$PKG_BUILD/* $ROOT/$TOOLCHAIN/lib/golang/
}
