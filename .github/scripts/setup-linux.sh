#!/bin/bash 


set -euo pipefail

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. ${DIR}/VERSIONS

#
# Setup build tooling
#
sudo apt install qmake

#
# Download 3rd party Libraries
#

mkdir /build && cd /build

curl -L -O https://download.savannah.gnu.org/releases/freetype/freetype-${FREETYPE_VERSION}.tar.gz \
tar xvfz freetype-${FREETYPE_VERSION}.tar.gz

curl -L -O https://sourceforge.net/projects/quazip/files/quazip/${QUAZIP_VERSION}/quazip-${QUAZIP_VERSION}.tar.gz/download \
tar xvfz quazip-${QUAZIP_VERSION}.tar.gz

curl -L -O https://dl.xpdfreader.com/XpdfReader-linux64-4.03.run
sh ./XpdfReader-linux64-${XPDF_VERSION}.run

ls -al 

#
#
#
