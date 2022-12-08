This is a buildpack adding a heroku-compatible version of the [tesseract](https://github.com/tesseract-ocr/tesseract)
package. It uses the most recent 4.x version and supports stacks 20 and 22. It currently only contains the language pack
for English.

# General build instructions

```sh
docker run -v (pwd):/src --rm -it heroku/heroku:20 bash /src/build.sh heroku-20
docker run -v (pwd):/src --rm -it heroku/heroku:22 bash /src/build.sh heroku-22
```

This will generate some tarballs you can check in.
