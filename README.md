This is a buildpack adding a statically-compiled version of the [tesseract](https://github.com/tesseract-ocr/tesseract)
package for Heroku. It uses the most recent 4.x version and supports several buildpacks.

# General build instructions

   1. `docker run --rm -v $(pwd):/src heroku/heroku:20`
   1. `apt-get install libleptonica-dev libpng-dev libtiff-dev libtool g++ pkg-config libgif-dev libicu-dev libpango1.0-dev`
   1. `mkdir /build`
   1. `cd /build`
   1. `curl -LOJ https://github.com/tesseract-ocr/tesseract/archive/refs/tags/4.1.3.tar.gz`
   1. `tar -zxvf tesseract-4.1.3.tar.gz`
   1. `cd tesseract-4.1.3`
   1. `mkdir build && cd build`
   1. `CFLAGS="-mtune=generic" CXXFLAGS="-mtune=generic" cmake -DBUILD_SHARED_LIBS=OFF -DSTATIC=ON -DGRAPHICS_DISABLED=ON -DBUILD_TRAINING_TOOLS=OFF ..
   1. `make`
   1. `mkdir -p /src/tesseract-4.1.3-heroku-20/bin`
   1. `mv bin/tesseract /src/tesseract-4.1.3-heroku-20/bin/`
   1. `mkdir -p /src/tesseract-4.1.3-heroku-20/lib`
   1. `cp -P /lib/x86_64-linux-gnu/liblept*so* /src/tesseract-4.1.3-heroku-20/lib/`
   1. `curl -O /src/tesseract-4.1.3-heroku-20/eng.traineddata https://github.com/tesseract-ocr/tessdata/raw/main/eng.traineddata`

Now from the host, you can tar up the `tesseract-4.1.3-heroku-20` directory.
