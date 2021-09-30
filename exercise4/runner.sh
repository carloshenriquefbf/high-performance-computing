#!/bin/bash

ORIGINAL_FILE=c/laplace.cxx
OPENMP_FILE=c/fixedLaplace.cxx
COMPILED_FILE=c/laplace

OUTPUT_PATH=documents/results.csv

MAX_THREADS=6

loadingAnimation() {
spin='-\|/'
i=0
while kill -0 $1 2>/dev/null
do
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  sleep .5
done
   printf "\r"
}

echo '-------------------------'

echo "Flags;Threads;Nx;Time;Result" > $OUTPUT_PATH

echo "Compiling the original given file with no flags..."
g++ $ORIGINAL_FILE -o $COMPILED_FILE
echo "Done!"
for nx in 512 1024 2048;
do
    echo "Running laplace.cxx with no flags for nx = $nx..."
    echo -n "No flags;1;" >> $OUTPUT_PATH
    echo $nx 100 0.0000000000000001 | $COMPILED_FILE >> $OUTPUT_PATH & pid=$!
    loadingAnimation $pid
    echo "Done!"
done
echo '-------------------------'

echo "Compiling the original given file with -O3 flag..."
g++ $ORIGINAL_FILE -O3 -o $COMPILED_FILE
echo "Done!"
for nx in 512 1024 2048;
do
    echo "Running laplace.cxx with -O3 flag for nx = $nx..."
    echo -n "-O3;1;" >> $OUTPUT_PATH
    echo $nx 100 0.0000000000000001 | $COMPILED_FILE >> $OUTPUT_PATH & pid=$!
    loadingAnimation $pid
    echo "Done!"
done
echo '-------------------------'

echo "Compiling the openmp file with fopenmp flag..."
g++ $OPENMP_FILE -fopenmp -o $COMPILED_FILE
echo "Done!"
for counter in $(seq 1 $MAX_THREADS)
do
    export OMP_NUM_THREADS=$counter
    for nx in 512 1024 2048;
    do
        echo "Running fixedLaplace.cxx with fopenmp flag for nx = $nx and using $counter thread(s)..."
        echo -n "-fopenmp;$counter;" >> $OUTPUT_PATH
        echo $nx 100 0.0000000000000001 | $COMPILED_FILE >> $OUTPUT_PATH & pid=$!
        loadingAnimation $pid
        echo "Done!"
    done
done
echo '-------------------------'

echo "Compiling the openmp file with fopenmp flag..."
g++ $OPENMP_FILE -fopenmp -O3 -o $COMPILED_FILE
echo "Done!"
for counter in $(seq 1 $MAX_THREADS)
do
    export OMP_NUM_THREADS=$counter
    for nx in 512 1024 2048;
    do
        echo "Running fixedLaplace.cxx with fopenmp and O3 flag for nx = $nx and using $counter thread(s)..."
        echo -n "-fopenmp -O3;$counter;" >> $OUTPUT_PATH
        echo $nx 100 0.0000000000000001 | $COMPILED_FILE >> $OUTPUT_PATH & pid=$!
        loadingAnimation $pid
        echo "Done!"
    done
done
echo '-------------------------'

echo 'The results are available on the documents folder'
