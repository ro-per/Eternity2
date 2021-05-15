#!/bin/bash

sizes=$1

echo "_________________________________ VISUALISER - Start _________________________________"
cd ..
# Files
pieces=pieces1_txt/pieces_$sizes.txt
solution=solutions/solution_$sizes.txt
# Run Visualiser
java -jar src/e2visualizer.jar "$pieces" "$solution" 0
