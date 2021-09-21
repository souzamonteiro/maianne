#!/bin/sh

rm -rf build/*
rm -rf docs/*

cat src/Shebang.js js/libmaia.js src/maianne.js > build/maianne.js

cp build/maianne.js js/
cp build/maianne.js bin/

chmod 755 bin/*

jsdoc -d ./docs ./package.json ./src

#cp manual/* docs/