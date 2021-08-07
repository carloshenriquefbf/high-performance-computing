#!/bin/bash
echo 'Making sure the required python libraries are installed...'
pip install pandas
pip install matplotlib
echo 'Done!'

echo '-------------------------'

echo 'Compiling matrixVectorMultiplication on C...'
cd c
gcc matrixVectorMultiplication.c -o matrixVectorMultiplication
echo 'Done!'
echo 'Running matrixVectorMultiplication on C:'
./matrixVectorMultiplication
echo 'Done!'
echo 'The data is available on the documents folder'

echo '-------------------------'

echo 'Compiling matrixVectorMultiplication on Fortran...'
cd ../fortran
gfortran matrixVectorMultiplication.f95 -o matrixVectorMultiplication
echo 'Done!'
echo 'Running matrixVectorMultiplication on Fortran:'
./matrixVectorMultiplication
echo 'Done!'
echo 'The data is available on the documents folder'

echo '-------------------------'

echo 'Plotting graphs...'
cd ../python
python3 graph.py

echo '-------------------------'

echo 'Done!'
echo 'The graphs for each language are available on the documents folder'

