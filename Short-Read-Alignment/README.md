# Short Read Alignment

### Zhibin Courtney Chen

## Method

### The input data are a subset of an RNA-Seq experiment for studying immune response and symbiosis in sea anemones (Aiptasia pallida)[1-2]. The sequencing result is from Illumina sequencing, with QC sequencing run.

### In this assignment, the open source aligner GSNAP is used. Here are the 6 major steps overview in this sequence Aiptasia sequence alignment. 

### 1. Quality trim the read.
### 2. Build an index of the reference genome (GMAP database[3], GFF3 file).
### 3. Build an index of intron splice sites from GFF3 file above.
### 4. Run the alignment using the gsnap command. 
### 5. Convert the sam file to bam file.
### 6. Convert the bam file to bam index file.

### Trimmomatic[4] is used for quality trim of the read run by java. We have paired-end read, PE in this case. The quality of encoding method used for the reads is -phred33. There are Paired and Unpaired outputs. The paired output file contains the left and right file, R1 and R2. The unpaired output file contains orphanage read — its mate was deleted due to low quality. There are several parameters that determine the trimming. The number of bases to remove from the beginning, HEADCROP, is 0, because we do not have barcodes to remove. For ILLUMINACLIP, Trimmomatic will look for seed matches, and allows 2 mismatches. If the paired end reads a score of 30 is reached, or in the case of single ended reads a score of 10, seeds will be extended and slipped. Trimmomatic will cut bases off the start of a read if LEADING is below 20 or TRAILING is below 20. The Sliding window trimming has the window size of 4 and the average quality being at least 30. The minimum length to keep, MILEN, is 36. 

### After trimming, the GMAP database is built from the Aiptasia genome with the command gmap_biuld. The output is stored in the directory AiptasiaGmapDb. This database serves as an index of the reference genome of Aiptasia, and allows faster alignment. 

### The index of intron is built based on the GMAP database, the GFF3 file using the command iit_store. With the help of index of intron, GSNAP will align reads across introns instead of aligning within the intron. 

### Use gsnap command to align the sequence. Store the output in the directory Sam. The output file is in the sam format, that we need to further convert into a sorted bam file with samtools and adding .sorted.bam to the end of the file. The output of converted bam files are stored in the directory called Bam. Lastly, samtools index command is used to create the bam file index, which helps with coordinate sorting, which makes reading the bam file much faster. 


## References

#### 1. Roesel, Charles L, & Vollmer, Steven V. (2019). Differential gene expression analysis of symbiotic and aposymbiotic Exaiptasia anemones under immune challenge with Vibrio coralliilyticus. Ecology and Evolution, 9(14), 8279-8293.
#### 2. Roesel, Charles L, Rosengaus, Rebeca B, Smith, Wendy, & Vollmer, Steven V. (2020). Transcriptomics reveals specific molecular mechanisms underlying transgenerational immunity in Manduca sexta. Ecology and Evolution, 10(20), 11251-11261.
#### 3. WU, Thomas D, & WATANABE, Colin K. (2005). GMAP : A genomic mapping and alignment program for mRNA and EST sequences. Bioinformatics (Oxford, England), 21(9), 1859-1875.
#### 4. Bolger, Anthony M, Lohse, Marc, & Usadel, Bjoern. (2014). Trimmomatic: A flexible trimmer for Illumina sequence data. Bioinformatics (Oxford, England), 30(15), 2114-2120. 
