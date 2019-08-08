#!/bin/bash -l
#SBATCH -J myjob
# Defined the time allocation you use
#SBATCH -A <time allocation>
# 10 minute wall-clock time will be given to this job
#SBATCH -t 00:10:00
# Number of nodes
#SBATCH --nodes=2
# Number of MPI processes per node
#SBATCH --ntasks-per-nodes=32
# load GNU compiler and mpi
module swap PrgEnv-cray PrgEnv-gnu
# Run program 
srun ./hello_world_mpi
