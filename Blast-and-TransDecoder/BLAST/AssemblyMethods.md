### Assembly Method

#### Zhibin Courtney Chen

### In this assignment, we use BLAST to align the reconstructed de novo assembly to compare sequence in the database. 

### To achive so, we take in total 5 steps. 

### First we used longest_orfs.pep command to find longest open reading frames. After we have those longest ORFs, we align proteins from ORFs to SwissProt with the help of the command blastp. This step help us to see if there is any similar proteins that can guide the prediction process. The next step is to use hmmscan command, by using HMM to find protein domains in the database to guide the prediction process. After that, we can refine the protein prediction, have protein fasta file output with --retain_pfam_hits and -retain_blastp_hits. Last but not least, we can align the output proteins against SwissProt, and write the output in tabular format in alignPredicted.txt. 
