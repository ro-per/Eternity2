#!/bin/bash

sizes=$1

echo "_________________________________ SOLVING - Start _________________________________"
cd ..
# Files
mzn_file=src/eternity2.mzn
dzn_file=pieces1_dzn/pieces_$sizes.dzn
out_file=solutions/solution_$sizes.txt
# Run Minizinc
solver=Chuffed
minizinc --solver "$solver" "$mzn_file" "$dzn_file" -o "$out_file" -s