#!/bin/bash
#SBATCH --job-name=cyclobutane_dft
# # SBATCH --account=account_name
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=4GB
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=71:00:30


module load intel/2023.07
module load GCC/13.2.0
module load FFTW/3.3.10

dftdir=/scratch/group/p.phy240167.000/codes/varga_dft_code_serial/release/

cd $SLURM_SUBMIT_DIR

$dftdir/dft > output 2> error
