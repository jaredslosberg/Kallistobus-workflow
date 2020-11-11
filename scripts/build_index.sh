#Recommended starting point for memory: 90gb
#Recommended starting point for time: 3 hours

cd /your/working/directory/preprocessing/required_files

echo "Building index..."
kallisto index -i mm_ens99_velocity_index_10xv3.idx -k 31 cDNA_introns.fa
