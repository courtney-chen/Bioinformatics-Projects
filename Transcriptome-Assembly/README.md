# Transcriptome and de novo assembly of Aiptasia

## Method 

### Two major scripts, runTrinity.sh and trinityDeNovo.sh, in this assignment used Trinity [1] for reference-guided transcriptome and de-novo assemblies of an RNA-Seq experiment for studying immune response and symbiosis in sea anemones (Aiptasia pallida) [2].
### The reference-guided transcriptome assembly, all 24 BAM files with Aip in the name from the previous module are merged to create the reference genome. The command “samtools merge” is used in the script “mergeAll.sh” for file merging 24 BAM files. The file “runTrinity.sh” contains the script  for transcriptome assembly using the command “-genome_guided_bam”. In the assembly, the maximum separation distance for segments of a transcript to span introns is 10000, which is reflected by the command “genome_guided_max_intron 10000”. 
### After the output of trinity_out_dir is checked to be correct, de-novo assembly is conducted with the script “trinityDeNovo.sh”. The quality-trimmed reads are used to assemble the de-novo transcriptome[3]. Two comma-separated lists of files for the left and right reads and the output directory for de-novo assembly are created in this script. 

### References

### [1] Haas, Brian J, Papanicolaou, Alexie, Yassour, Moran, Grabherr, Manfred, Blood, Philip D, Bowden, Joshua, . . . Regev, Aviv. (2013). De novo transcript sequence reconstruction from RNA-seq using the Trinity platform for reference generation and analysis. Nature Protocols, 8(8), 1494-1512.
### [2] Steven V. (2019). Differential gene expression analysis of symbiotic and aposymbiotic Exaiptasia anemones under immune challenge with Vibrio coralliilyticus. Ecology and Evolution, 9(14), 8279-8293.
### [3]Fan, Lin, Nusbaum, Chad, Haas, Brian J, Chen, Zehua, Lindblad-Toh, Kerstin, Raychowdhury, Raktima, . . . Levin, Joshua Z. (2011). Full-length transcriptome assembly from RNA-Seq data without a reference genome. Nature Biotechnology, 29(7), 644-652. 

