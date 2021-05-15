#!/bin/bash

sizes=$1
version=$2
echo " _________________________________ SELECTED SIZE=$sizes _________________________________"

sh run_minizinc.sh "$sizes" "$version"
sh run_visualiser.sh "$sizes" "$version"
