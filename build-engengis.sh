#!/bin/sh
# Copyright (c) 2012, Jake "redmaner" van der Putten
# Engengis build tool

# System requirements
# -----------------------------------------
# - Ubuntu (or any other unix based system)
# - Java (to sign zip file)
# - zip/unzip (apt-get install zip/apt-get install unzip)

NAME=jake

echo "Start building engengis..."
cd include
echo "Making zip archieve..."
zip -r engengis * &
cd ..
sleep 3
echo "Signing zip archieve..."
mv /home/$NAME/engengis/include/engengis.zip /home/$NAME/engengis/signzip/engengis.zip
cd signzip
java -jar signapk.jar testkey.x509.pem testkey.pk8 engengis.zip signed-engengis.zip
cd ..
mv /home/$NAME/engengis/signzip/signed-engengis.zip /home/$NAME/engengis/build/Engengis.Delta_build-.zip
echo "Done find build at:"
echo "/build/Engengis.Delta_build-.zip"

