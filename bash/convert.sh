#!/bin/bash

sizes=$1

echo "_________________________________ TRANSFORMING INPUT FILE - Start _________________________________"
cd ..
cd src || exit
javac Convert_txt_to_dzn.java
java Convert_txt_to_dzn "$sizes"
cd ..
cd bash || exit