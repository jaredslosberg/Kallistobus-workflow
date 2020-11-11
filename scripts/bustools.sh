#This script aggregates transcripts that meet a certain criteria (such as pseudoaligning to an exon) and generates three files:
#a cell by gene count matrix (m genes x n cells)
#a list of gene names (ensembl ids) (m)
#a list of cell barcodes (n)

#Recommended starting memory: 15 gb
#Recommended starting time: 2 hours


cd /ywd/preprocessing/kallisto_out/sample1
mkdir cDNA_capture/ introns_capture/ spliced/ unspliced/ 

echo Quantifying transcripts for sample1 with bustools

# -s flag specifies that the capture list is transcript list.
#Change directories and whitelist as needed
#File names should stay be the same
bustools correct -w ../../required_files/10xv3_whitelist.txt -p output.bus | bustools sort -o output.correct.sort.bus -t 4 -
bustools capture -s -o cDNA_capture/spliced.bus -c ../../required_files/cDNA_tx_to_capture.txt -e matrix.ec -t transcripts.txt output.correct.sort.bus
bustools capture -s -o introns_capture/unspliced.bus -c ../../required_files/introns_tx_to_capture.txt -e matrix.ec -t transcripts.txt output.correct.sort.bus
bustools count -o unspliced/u -g ../../required_files/tr2g.tsv -e matrix.ec -t transcripts.txt --genecounts introns_capture/unspliced.bus
bustools count -o spliced/s -g ../../required_files/tr2g.tsv -e matrix.ec -t transcripts.txt --genecounts cDNA_capture/spliced.bus

cd /home/jared/ENS/Timecourse_ENS/preprocessing/kallisto_out/sample2
mkdir cDNA_capture/ introns_capture/ spliced/ unspliced/

echo Quantifying transcripts for p11 with bustools


bustools correct -w ../../required_files/10xv3_whitelist.txt -p output.bus | bustools sort -o output.correct.sort.bus -t 4 -
bustools capture -s -o cDNA_capture/spliced.bus -c ../../required_files/cDNA_tx_to_capture.txt -e matrix.ec -t transcripts.txt output.correct.sort.bus
bustools capture -s -o introns_capture/unspliced.bus -c ../../required_files/introns_tx_to_capture.txt -e matrix.ec -t transcripts.txt output.correct.sort.bus
bustools count -o unspliced/u -g ../../required_files/tr2g.tsv -e matrix.ec -t transcripts.txt --genecounts introns_capture/unspliced.bus
bustools count -o spliced/s -g ../../required_files/tr2g.tsv -e matrix.ec -t transcripts.txt --genecounts cDNA_capture/spliced.bus


echo "Done"

