#!/bin/bash
ulimit -s unlimited
export OMP_NUM_THREADS=16
lib_path=$(readlink -f ../../lib)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$lib_path
mpirun -np 1 ../../bin/swdockp2_v8
