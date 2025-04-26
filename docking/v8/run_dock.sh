#!/bin/bash
lib_path=$(readlink -f ../../lib)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$lib_path
export OMP_NUM_THREADS=${num_threads}

ulimit -s unlimited
mpirun -np ${num_proc} ../../bin/swdockp2_v8
