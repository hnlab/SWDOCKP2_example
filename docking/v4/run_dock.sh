#!/bin/bash
ulimit -s unlimited
export OMP_NUM_THREADS=4
../../bin/swdockp2_v4
