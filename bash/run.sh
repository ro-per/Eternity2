#!/bin/bash

sizes=$1
echo " _________________________________ SELECTED SIZE=$sizes _________________________________"

sh convert.sh "$sizes"
sh solve.sh "$sizes"
sh visualize.sh "$sizes"
