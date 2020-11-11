#!/bin/bash
#SBATCH --account=lgoff2
#SBATCH --job-name=getVeloFiles
#SBATCH --time=2:00:00
#SBATCH --partition=shared
#SBATCH --nodes=1
#SBATCH --mem=20gb
#SBATCH --mail-type=end
#SBATCH --mail-user=jslosbe1@jhu.edu

##---------------------------------------------------------------------
## SLURM job script to run kallisto index building
##---------------------------------------------------------------------

##Set up environment
ml singularity/3.5

cd ~/work-lgoff2/users/jslosberg/kallisto_bus_tutorial/

#This is an example of how to call a scripts within the singularity container.
#For a bash script, use "bash" instead of "Rscript"
singularity exec scAnalysis.sif Rscript scripts/get_velocity_files.R

echo "we got here"


