## Module 9: KEGG and GO

### In previous assignment, the genome assembly was done for both genome-guided and de-novo transcriptomes, predicted proteins was found, and aligned to SwissProt using BLAST. 

### In this assignment, we match the protein IDs that are associated with SwissProt protein IDs to species-independent controlled vocabularies, Kyoto Encyclopedia of Genes and Genomes (KEGG) and the Gene Ontology (GO). KEGG and GO data are retrieved for a set of transcripts, combining the data into a single annotation file using Python and R.


### Here are the steps in this assignment:
### (1) we first obtained the KEGG IDs with UniProt ID using the script “getOneKegg.sh". 
### (2) After having the KEGG IDs, we used it to find the KO with "getOneKo.sh". 
### (3) Having the KEGG Orthology database ID, we can get the KEGG pathways associated with a KEGG ortholog by "getOnePath.sh". The script "getPathDesc.sh" helps to get all KO pathways' KEGG pathway descriptions.
### (4) "get_kegg_ids.py" script specifies independent species KO entries. 
### (5) With the KO entries, we can use the script "get_ko.py" to obtain the KEGG pathways. 
### (6) At last, we merge the tabular files, which are the outputs from previous script -- kegg.txt, ko.txt, path.txt. 
### (7) R Script is run to characterize the KEGG data with the script "mergeAll.R".
