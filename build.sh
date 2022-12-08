#!/bin/bash

set -euo pipefail

VERSION=4.1.3
STACK=heroku-20

apt-get update -y
apt-get install -y libleptonica-dev libpng-dev libtiff-dev libtool g++ pkg-config libgif-dev libicu-dev libpango1.0-dev cmake
mkdir -p /build
cd /build || exit 1
curl --fail -sq -LOJ "https://github.com/tesseract-ocr/tesseract/archive/refs/tags/${VERSION}.tar.gz"
tar --strip-components=1 -zxvf "tesseract-${VERSION}.tar.gz"
mkdir build
cd build || exit 1
CFLAGS="-mtune=generic" CXXFLAGS="-mtune=generic" cmake -DBUILD_SHARED_LIBS=OFF -DSTATIC=ON -DGRAPHICS_DISABLED=ON -DBUILD_TRAINING_TOOLS=OFF -DMARCH_NATIVE_OPT=OFF ..
make VERBOSE=1
mkdir -p /src/tesseract-${VERSION}-${STACK}/bin
mv bin/tesseract /src/tesseract-4.1.3-${STACK}/bin/
mkdir -p /src/tesseract-${VERSION}-${STACK}/lib
cp -P /lib/x86_64-linux-gnu/liblept*so* /src/tesseract-4.1.3-${STACK}/lib/
cp -P /lib/x86_64-linux-gnu/libgif*so* /src/tesseract-4.1.3-${STACK}/lib/
mkdir -p /src/tesseract-${VERSION}-${STACK}/share
curl --fail -sq -O /src/tesseract-${VERSION}-${STACK}/share/eng.traineddata https://github.com/tesseract-ocr/tessdata/raw/main/eng.traineddata
cd /src
umask 000
tar -czpf tesseract-${VERSION}-${STACK}.tar.gz tesseract-${VERSION}-${STACK}
