## Module 8 BLAST and TransDecoder

### In this assignment, BLAST is used to align the reconstructed de-novo assembly to compare sequences in the database. TransDecoder, the protein prediction program is used for identifying the predicted proteins with mRNA sequences. 


### To achive so, we take in total 5 steps.
### (1) First we used longest_orfs.pep command to find longest open reading frames. 
### (2) After we have those longest ORFs, we align proteins from ORFs to SwissProt with the help of the command blastp. This step help us to see if there is any similar proteins that can guide the prediction process. 
### (3) The next step is to use hmmscan command, by using HMM to find protein domains in the database to guide the prediction process. 
### (4) After that, we can refine the protein prediction, have protein fasta file output with --retain_pfam_hits and -retain_blastp_hits. 
### (5) Last but not least, we can align the output proteins against SwissProt, and write the output in tabular format in alignPredicted.txt.
