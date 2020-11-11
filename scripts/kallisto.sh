
#Script to complete pseudoalignment of fastq files to a pre-built index
#Recommended starting memory: 90gb
#Recommended starting time: depends on data

mkdir /ywd/preprocessing/kallisto_out
cd /ywd/preprocessing/kallisto_out
mkdir sample1/ sample2/

cd /ywd/preprocessing/sample1

echo working on sample1 pseudoalignment

kallisto bus -i ../required_files/mm_ens99_velocity_index_10xv3.idx -o ./kallisto_out/sample1 -x 10xv3 -t 4 \
	path/to/data/read1.fastq.gz \
	path/to/data/read2.fastq.gz \

echo sample1 pseudoalignment complete, working on sample2

cd /ywd/preprocessing/sample2

kallisto bus -i ../required_files/mm_ens99_velocity_index_10xv3.idx -o ./kallisto_out/sample1 -x 10xv3 -t 4 \
	path/to/data/read1.fastq.gz \
	path/to/data/read2.fastq.gz \

echo all done!
#
