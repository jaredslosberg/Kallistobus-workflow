## Kallisto Bustools Tutorial
### Jared Slosberg
### 8/24/2020



## Files required:

Configuration files:
kallistobus.yaml 
scAnalysis.sif (note: if only .def file is included, it must be built)

Scripts
init.sh
get_velocity_files.R
run_get_velocity_files.slurm
build_index.sh
kallisto.sh
bustools.sh

Note: This workflow follows the kallisto bus tutorial that is tailored to preparation for RNA velocity analysis (which generates two count matrices, one for spliced transcripts, and the other for unspliced transcripts). It is only a few extra lines of code compared to the regular kallisto/bus processing. The spliced transcripts are from exonic cDNA, and are what should be used for all downstream analyses (eg Seurat/Monocle/Scanpy). The unspliced transcripts should only be used in an RNA velocity analysis. 

If you want some extra practice, you could modify this workflow to one that just does the canonical exonic counts. You could follow this tutorial for that: https://www.kallistobus.tools/getting_started

1. Set-up environment
All the scripts can be run from within the singularity container. If there are any issues, kallisto and bustools are also installed in the conda environment provided. Try using the container first.
The .yaml file contains the details for a conda environment complete with recent versions of kallisto and bustools
Run "init.sh"

2. Obtain required files for building the index (and later parsing transcripts)
Submit "run_get_velocity_files.slurm" which will run "get_velocity_files.R"
Note: For the rest of the steps, you will need to make your own slurm scripts to submit to Sbatch

3. Build Index for pseudoalignment
Submit "build_index.sh"
For mouse, v99 from ensembl works
For this and downstream steps, specify the correct 10x chemistry (v2 vs v3)

4. Run pseudoaligment (kallisto)
Note: if your sequencing data isn't in fastq format you will need to convert it before this
Submit "kallisto.sh"

5. Run transcript/gene counting (bustools)
Submit "bustools.s"
The count matrices will be generated in the "s" folder within each sample
They can then be provided to Seurat/Monocle/Scanpy along with the barcodes and gene text files within that folder)




Using a Custom Singularity Container on MARCC

Singularity can be loaded on MARCC via:

$ ml singularity/3.5
Run a script within a container
With an existing, pre-built singularity image on MARCC ( ".simg" or ".sif" format), a bash script can be called by:

$ singularity exec /path_to_image/my_image.simg bash /path_to_script/myscript.sh

Similarly, an R script can be called by:

$ singularity exec /path_to_image/my_image.simg Rscript /path_to_script/myscript.R


