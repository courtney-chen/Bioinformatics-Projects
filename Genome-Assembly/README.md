Module 10 Lab Report

Author: Zhibin Chen

Methods

In this assignment, we used SPAdes assembler [1] to assemble the genome of Rhodobacter sphaeroides obtained from NCBI’s Sequence Read Archive (SRA)
 and analyzed it with QUAST [2]. 

To retrieve the sequence data in fastq with SRA, we did it with the script “getNGS.sh”, which used the command “fastq-dump” and “- -split-files”. It gave left and right read files separately – “SRR522244 1.fastq” and “SRR522244_2.fastq”. 

In order for assembly, we trimmed the data with “trim.sh”. In this script, we used several parameters: 1 thread, 33 phred quality score, the minimum length to keep, MILEN, is 36, the sliding window trimming has the window size of 4 and the average quality being at least 30, cut bases off the start of a read if LEADING is below 20 or TRAILING is below 20. The paired and unpaired reads are saved in separate directories – “Paired” and “Unpaired”. [3]

To assemble the sequence, SPAdes assembler was used in the script “runSpades.sh”. Trimmed paired reads are assembled together with 4 as the number of threads. The output of the run is stored in the directory “Rhodo” (which got accidently deleted in GitHub, but the required “scaffolds.fasta” file was uploaded to the GitHub). 

With the assembled genome, we could analyze it with QUAST, which used quast.py. The script “runQuast.sh” analyzed the assembly, “scaffolds.fasta” file. Since it is a scaffold, we used -s option to split them and add contigs to the comparison. -t 4 was used instead of 16. -f option was used for completing gene finding. The reference genome we used was from NCBI genome called “Rhodobacter sphaeroides”. The output of this script was stored in quast_output directory. 

Conclusions from Analysis

Comparing the N50 of scaffolds and scaffold_broken, we can see that the N50 of scaffolds is 27657, which is higher than scaffold_broken N50, 25496. This is because scaffold_broken was split by QUAST by continuous fragments that is N is of length greater than 10. Contigs are reconstructed this way for reconstruction of the scaffolds. Therefore, broken scaffolds are supposed to be smaller due to its fragmented nature. Our data, N50 of scaffold having greater number than scaffold_broken indicates that the assembly does not contain too much misassemblies, which is reflect in misassemblies – both scaffold and scaffold_broken have the same number of misassemblies. 

The Nx plot shows Nx values as x from 0 to 100%, and its corresponding contigs length (L). The data variation between scaffold and broken scaffold mainly concentrates around where N is bigger than 50, contig length is bigger than around 40-50. 

The GC content plot shows the GC content percentage of scaffolds, scaffolds_broken and the reference genome. In this plot, three lines are overlapping to each other, indicating that our assembly is very similar to the reference genome we used here for comparison. 

The cumulative plot shows the growing contig length and compare it with the length of reference genome. The x-axis is the number of bases in a growing manner. The top of y-axis is the total length of reference genome. Scaffold and scaffold_broken’s contig growing are overlapping to each other indicates the same rate of contig growth. They both eventually cumulated to the same length as reference genome. 

The coverage histogram compares and shows the distribution of the total length of the genome (y) with the different read coverage depths (x). Our plot shows that when our different read coverage depth at around 15-16, most length of the genome is covered.  

The reference genome has the total sequence length of 4,602,977, while our assembly yielded the total aligned sequence length of 4,530,867, which is smaller than the actual genome length. The number of predicted genes found by GeneMarks is 4471, which is smaller than the genes in reference genome.

Future Directions

The future steps include associating the function to the proteins in the assembled genome and specifying GO Terms. To find the gene function, we will need to parse GFF to FASTA format. Here are the general steps for obtaining the protein function: 
1. obtain the KEGG ortholog ID with KEGG AIP.
2. convert the SwissProt to KEGG for one protein. KEGG ID will be obtained here with the uniport ID. 
3. get the KEGG ortholog from each KEGG protein ID.
4. get the KEGG pathways and the description that is correspond to KEGG ortholog.
5. parse a tabular file
6. merge tabular file with the previous scripts to characterize the KEGG data to find out the GO germs and the associated function of the protein. 

References

[1] Bankevich, Anton et al. “SPAdes: a new genome assembly algorithm and its applications to single-cell sequencing.” Journal of computational biology : a journal of computational molecular cell biology vol. 19,5 (2012): 455-77. doi:10.1089/cmb.2012.0021

[2] Gurevich, Alexey, Saveliev, Vladislav, Vyahhi, Nikolay, and Tesler, Glenn. "QUAST: Quality Assessment Tool for Genome Assemblies." Bioinformatics (Oxford, England) 29.8 (2013): 1072-075. Web.

[3] Bolger, Anthony M, Lohse, Marc, and Usadel, Bjoern. "Trimmomatic: A Flexible Trimmer for Illumina Sequence Data." Bioinformatics (Oxford, England) 30.15 (2014): 2114-120. Web.


