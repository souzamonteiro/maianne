#!/bin/sh

rm -rf build/*
rm -rf docs/*

cp src/maianne.maia build/

cp build/maianne.maia bin/

chmod 755 bin/*

jsdoc -d ./docs ./package.json ./src

#cp manual/* docs/