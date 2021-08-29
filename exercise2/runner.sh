#!/bin/bash
echo '-------------------------'
cd c

echo 'Compiling the original given file (laplace.cxx) with the profiling flag activated...'
g++ -pg -o laplace laplace.cxx
echo 'Done!'
echo 'Running laplace.cxx:'
echo 500 100 0.0000000000000001 | ./laplace
echo 'Done!'
echo 'Running gprof...'
gprof ./laplace gmon.out > ../reports/laplace.txt
echo 'Done!'

echo '-------------------------'
echo 'Compiling the fixed file (fixedLaplace.cxx) with the profiling flag activated...'
g++ -pg -o fixedLaplace fixedLaplace.cxx
echo 'Done!'
echo 'Running laplace.cxx:'
echo 500 100 0.0000000000000001 | ./fixedLaplace
echo 'Done!'
echo 'Running gprof...'
 gprof ./fixedLaplace gmon.out > ../reports/fixedLaplace.txt
echo 'Done!'

echo 'The reports for each file are available on the reports folder'

