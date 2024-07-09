#!/bin/bash
#SBATCH --job-name="chignolin_run_MTD"
#SBATCH --output="job.out"
#SBATCH --partition=gpu-shared
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=50G
#SBATCH --account=ucd187
#SBATCH --no-requeue
#SBATCH --mail-user=ssiddharth@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -t 48:00:00


module purge
module load shared
module load gpu/0.15.4
module load slurm
module load openmpi/4.0.4
module load cuda/11.0.2
module load amber/20
module load plumed/2.6.1

export PATH=$PATH:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
source $AMBERHOME/amber.sh
echo $AMBERHOME
#export PLUMED_KERNEL=/home/ssonti/miniconda3/lib/libplumedKernel.so
export PLUMED_KERNEL=/cm/shared/apps/spack/gpu/opt/spack/linux-centos8-skylake_avx512/gcc-8.3.1/plumed-2.6.1-63lfaa2clqpjeif3aa3kdk44ozvlzkac/lib/libplumedKernel.so
pmemd.cuda -O -i md.in -o md.out -p chignolin.prmtop -c md2.rst -r md3.rst -x md.nc

