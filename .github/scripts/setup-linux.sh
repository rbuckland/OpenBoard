#!/bin/bash 


set -euo pipefail

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. ${DIR}/VERSIONS

#
# Setup build tooling
#
# sudo apt install qmake

#
# Download 3rd party Libraries
#

mkdir build && cd build

# Ref: https://freetype.org/download.html
curl -L -O https://download.savannah.gnu.org/releases/freetype/freetype-${FREETYPE_VERSION}.tar.gz 
tar xvfz freetype-${FREETYPE_VERSION}.tar.gz

# Ref: https://sourceforge.net/projects/quazip/files/quazip/
#      http://quazip.sourceforge.net/
curl -L -o quazip-${QUAZIP_VERSION}.tar.gz https://sourceforge.net/projects/quazip/files/quazip/${QUAZIP_VERSION}/quazip-${QUAZIP_VERSION}.tar.gz/download
tar xvfz quazip-${QUAZIP_VERSION}.tar.gz

# Ref: https://www.xpdfreader.com/download.html
curl -L -O https://dl.xpdfreader.com/XpdfReader-linux64-4.03.run
echo yes | sh ./XpdfReader-linux64-${XPDF_VERSION}.run

# Ref: https://wiki.qt.io/Building_Qt_5_from_Git#Getting_the_source_code
git clone https://code.qt.io/qt/qt5.git \
  && cd qt5 \
  && git checkout ${QT_VERSION}  \
  && cd ..
  
mkdir qt5-build
cd qt5-build
../qt5/configure -developer-build -opensource -nomake examples -nomake tests

#
#
#
