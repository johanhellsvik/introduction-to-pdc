#!/bin/bash -l
#SBATCH -J myjob
# Defined the time allocation you use
#SBATCH -A <time allocation>
# 10 minute  wall-clock time will be given to this job
#SBATCH -t 10:00
# Number of nodes
#SBATCH --nodes=2
# load GNU compiler and mpi
module add gcc/5.1 openmpi/1.8-gcc-5.1 
# Run program 
mpirun -n 48 -N 24 ./hello_world_mpi
