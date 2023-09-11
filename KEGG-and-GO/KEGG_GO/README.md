# KEGG and GO

#### Zhibin Chen

### In this assignment, we first obtained the KEGG IDs with UniProt ID using the script “getOneKegg.sh". After having the KEGG IDs, we used it to find the KO with "getOneKo.sh". Having the KEGG Orthology database ID, we can get the KEGG pathways associated with a KEGG ortholog by "getOnePath.sh". The script "getPathDesc.sh" helps to get all KO pathways' KEGG pathway descriptions. "get_kegg_ids.py" script specifies independent species KO entries. With the KO entries, we can use the script "get_ko.py" to obtain the KEGG pathways. At last, we merge the tabular files, which are the outputs from previous script -- kegg.txt, ko.txt, path.txt. R Script is run to characterize the KEGG data with the script "mergeAll.R".
