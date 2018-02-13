#!/bin/bash -l
#SBATCH -J myjob
# Defined the time allocation you use
#SBATCH -A <time allocation>
# 10 minute  wall-clock time will be given to this job
#SBATCH -t 10:00
# Number of nodes
#SBATCH --nodes=2
# load GNU compiler and mpi
module swap PrgEnv-cray PrgEnv-gnu
# Run program 
aprun -n 32 -N 16 ./hello_world_mpi
