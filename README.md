This is a buildpack adding a statically-compiled version of the [tesseract](https://github.com/tesseract-ocr/tesseract)
package for Heroku. It uses the most recent 4.x version and supports several buildpacks.

# General build instructions

`docker run -v (pwd):/src --rm -it heroku/heroku:20 bash /src/build.sh`

Now from the host, you can tar up the `tesseract-4.1.3-heroku-20` directory.
