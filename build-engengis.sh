#!/bin/sh
# Copyright (c) 2012, Jake "redmaner" van der Putten
# Engengis build tool
# Version: 21012012

# System requirements
# -----------------------------------------
# - Ubuntu (or any other unix based system)
# - Java (to sign zip file)
# - zip/unzip (apt-get install zip/apt-get install unzip)

VERSION=`cat currentversion`

if [ -d build ]; then
     echo "Start building engengis..."
     sleep 1
else
     mkdir build
fi;
cd include
echo "Making zip archieve..."
sleep 1
zip -r engengis * 
cd ..
sleep 2
echo "Signing zip archieve..."
mv include/engengis.zip signzip/engengis.zip
cd signzip
java -jar signapk.jar testkey.x509.pem testkey.pk8 engengis.zip signed-engengis.zip
cd ..
mv signzip/signed-engengis.zip build/$VERSION.zip
echo "Done find build at:"
echo "/build/$VERSION.zip"
rm -f signzip/engengis.zip
sleep 3
