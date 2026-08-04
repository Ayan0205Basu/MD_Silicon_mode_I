#!/bin/sh
#PBS -N lmp_mid_crack_test
#PBS -P am
#PBS -q test
#PBS -m bea
#PBS -M amz218552@iitd.ac.in
################################
#PBS -l select=1:ncpus=2:centos=hashwell
#PBS -l walltime=01:00:00


export OPM_NUM_THREADS=1

# ENVOURMENT
echo $PBS_JOBID
cat $PBS_NODEFILE

cd $PBS_O_WORKDIR

module load apps/lammps/intel/7Aug19
time -p mpirun -np $PBS_NTASKS lmp_mpi_cpu -in in.txt