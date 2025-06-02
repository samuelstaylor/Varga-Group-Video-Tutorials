#!/bin/bash
#SBATCH --job-name=cyclobutane_tddft
# # SBATCH --account=account_name
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --ntasks=26
#SBATCH --mem=260GB
#SBATCH --ntasks-per-node=26
#SBATCH --cpus-per-task=1
#SBATCH --time=72:00:00

module load intel-compilers/2024.0.0
module load impi/2021.11.0
module load GCC/13.2.0
module load FFTW/3.3.10
module load imkl/2024.0.0

dftdir=/home/u.cc48522/codes/dft_parallel/release/

cd $SLURM_SUBMIT_DIR

mpirun -n 26 $dftdir/dft > output 2> error