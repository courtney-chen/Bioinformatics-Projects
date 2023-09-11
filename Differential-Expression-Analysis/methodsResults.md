## Method

In this module we identify the differential expression of genes. Two
main steps are involved to achive it – retreive the data of relative
abundance of transcripts, then apply statistical models to examine the
differential expression between treatment groups.

In the first step, Salmon (Patro et al. 2017) is used to estimate the
relative abundance of transcripts. With the help of tximport (Soneson,
Love, and Robinson 2015), data can be imported for DESeq2 (Love, Huber,
and Anders 2014) to achive teh second step, running the statistical
test.

## Results

``` r
#!/usr/bin/env Rscript
# de.R

library(tximport)
library(readr)
library(DESeq2)
library(knitr)
# this is the library that will disply formatted tables

tx2gene <- read.csv("tx2gene.csv")
head(tx2gene)
```

    ##                     trans        ko
    ## 1 TRINITY_DN9495_c0_g1_i2 ko:K00134
    ## 2 TRINITY_DN9573_c0_g1_i1 ko:K01689
    ## 3 TRINITY_DN9485_c0_g1_i1 ko:K02111
    ## 4 TRINITY_DN8020_c0_g1_i1 ko:K04043
    ## 5 TRINITY_DN9453_c0_g1_i1 ko:K02932
    ## 6 TRINITY_DN8136_c0_g1_i1 ko:K02932

``` r
samples <- read.csv("/scratch/SampleDataFiles/Samples.csv", header=TRUE)
# read Sample.csv as samples
kable(head(samples))
```

| Sample | Menthol | Vibrio  |
| :----- | :------ | :------ |
| Aip17  | Menthol | Vibrio  |
| Aip20  | Control | Vibrio  |
| Aip24  | Menthol | Control |
| Aip28  | Control | Control |
| Aip14  | Menthol | Vibrio  |
| Aip26  | Control | Vibrio  |

``` r
# read the sample as table

files <- file.path("quant", samples$Sample, "quant.sf")
# read the quant.sf file
txi <- tximport(files, type = "salmon", tx2gene=tx2gene)
```

    ## reading in files with read_tsv

    ## 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 
    ## removing duplicated transcript rows from tx2gene
    ## transcripts missing from tx2gene: 34247
    ## summarizing abundance
    ## summarizing counts
    ## summarizing length

``` r
# import the salmon alignments save it as txi
# read in file

dds <- DESeqDataSetFromTximport(txi, colData = samples, design = ~ Menthol +Vibrio)
```

    ## using counts and average transcript lengths from tximport

``` r
# import the Salmon alignments into DSeq2
# using counts and average transcript lengths from tximport
dds$Vibrio <- relevel(dds$Vibrio, ref = "Control")
dds$Menthol <- relevel(dds$Menthol, ref = "Control")
keep <- rowSums(counts(dds)) >= 10

dds <- dds[keep,]
dds <- DESeq(dds)
```

    ## estimating size factors
    ## using 'avgTxLength' from assays(dds), correcting for library size
    ## estimating dispersions
    ## gene-wise dispersion estimates
    ## mean-dispersion relationship
    ## final dispersion estimates
    ## fitting model and testing

``` r
# the dds here already has ko as its row name

padj <- 0.05
minLog2FoldChange <- 0.5
dfAll<- data.frame()
# get all DE results except intercept, and "flatten" into a single file
for (result in resultsNames(dds)){
    if (result != "Intercept"){
        # if result doest not intercept
        res <- results (dds, alpha = 0.05, name = result)
        dfRes <- as.data.frame(res)
        dfRes <- subset(subset(dfRes, select=c(log2FoldChange,padj)))
        # dfRes includes also log2FoldChange and pdaj data
        # dfRes <- subset(dfRes, padj < 0.05)
        # filter to keep the data with pdaj < 0.05
        dfRes$Factor <- result
        # Factor in dfRes is result, which is all DE result except intercept
        dfAll <- rbind(dfAll, dfRes)
        # the final dfAll includes dataframe of dfAll, and dfRes, combine rows
    }
}

dfAll <- subset(dfAll, padj < 0.05) 
# filter, and keep the data with padj < 0.05 
dfAll <- cbind(rownames(dfAll), data.frame(dfAll, row.names=NULL))
# create another data frame also called dfAll,turn the rowname ko into a regular column
colnames(dfAll)[1] <-"ko" 
# give the new ko column a column name "ko"
kable(dfAll)
```

| ko         | log2FoldChange |      padj | Factor                        |
| :--------- | -------------: | --------: | :---------------------------- |
| ko:K04354  |    \-2.0688507 | 0.0272942 | Menthol\_Menthol\_vs\_Control |
| ko:K13785  |    \-2.6733819 | 0.0000154 | Menthol\_Menthol\_vs\_Control |
| ko:K14965  |    \-6.1769492 | 0.0000000 | Menthol\_Menthol\_vs\_Control |
| ko:K17920  |      1.1188140 | 0.0000011 | Menthol\_Menthol\_vs\_Control |
| ko:K20369  |      0.6054905 | 0.0163247 | Menthol\_Menthol\_vs\_Control |
| ko:K004691 |    \-0.5533904 | 0.0492597 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K006431 |      1.4401303 | 0.0000286 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K012061 |      3.2302607 | 0.0000163 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K012511 |      1.9686570 | 0.0007984 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K015961 |      2.9554204 | 0.0000000 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K016811 |      1.4075955 | 0.0026199 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K021831 |    \-0.5739979 | 0.0186986 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K028721 |    \-2.4631920 | 0.0272823 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K028731 |    \-1.6212071 | 0.0002488 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K030071 |    \-3.4481444 | 0.0003193 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K036261 |      2.3914337 | 0.0000163 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K057541 |      1.1687518 | 0.0014193 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K089571 |      2.1819205 | 0.0206183 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K095691 |      2.4814936 | 0.0116338 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K107041 |      1.2505578 | 0.0152809 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K147531 |      0.7923661 | 0.0012878 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K161861 |      2.3334537 | 0.0014619 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K197651 |    \-0.4822172 | 0.0000839 | Vibrio\_Vibrio\_vs\_Control   |
| ko:K203691 |    \-0.6190148 | 0.0026199 | Vibrio\_Vibrio\_vs\_Control   |

``` r
# to check the output after filtering out some data 

# ko is the column name
pathfile <- "/scratch/SampleDataFiles/Annotation/path.txt"
# path of the file
pathname <- "/scratch/SampleDataFiles/Annotation/ko"
# path of the pathway name 
# for merging pathways and pathway names 

table_path <- read.table(pathfile, sep = '\t', header =FALSE)
# read path.txt as a table
table_name <- read.table(pathname, sep = '\t', header = FALSE)
# read ko as a table 

# table_path contains the ko id 
#table_name contains the corresponding name

colnames(table_path) <- c("ko", "path_ko")
# set "ko" and "table_path" to column name for table_path table
colnames(table_name) <- c("path_ko", "name")
# set "table_path" and "name_table" as column name for table_name table 

dfAll <- merge(dfAll,table_path)
deAnnotated <- merge(dfAll,table_name)
# merge the dfAll with pathfile first, then merge the result with the name
# since they have same column names, the system merges column with same names together
kable(deAnnotated)
```

| path\_ko     | ko        | log2FoldChange |      padj | Factor                        | name                                      |
| :----------- | :-------- | -------------: | --------: | :---------------------------- | :---------------------------------------- |
| path:ko03015 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | mRNA surveillance pathway                 |
| path:ko04071 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Sphingolipid signaling pathway            |
| path:ko04111 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Cell cycle - yeast                        |
| path:ko04144 | ko:K17920 |       1.118814 | 0.0000011 | Menthol\_Menthol\_vs\_Control | Endocytosis                               |
| path:ko04151 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | PI3K-Akt signaling pathway                |
| path:ko04152 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | AMPK signaling pathway                    |
| path:ko04261 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Adrenergic signaling in cardiomyocytes    |
| path:ko04390 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Hippo signaling pathway                   |
| path:ko04391 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Hippo signaling pathway - fly             |
| path:ko04530 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Tight junction                            |
| path:ko04728 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Dopaminergic synapse                      |
| path:ko05142 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Chagas disease (American trypanosomiasis) |
| path:ko05160 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Hepatitis C                               |
| path:ko05165 | ko:K04354 |     \-2.068851 | 0.0272942 | Menthol\_Menthol\_vs\_Control | Human papillomavirus infection            |

``` r
write.csv(deAnnotated, file = "deAnnotated.csv") 
# write the result to csv file 
```

## References

<div id="refs" class="references">

<div id="ref-Love">

Love, Michael I., Wolfgang Huber, and Simon Anders. 2014. “Moderated
Estimation of Fold Change and Dispersion for RNA-Seq Data with DESeq2.”
*Genome Biology* 15 (12): 550–50.
<https://doi.org/10.1186/s13059-014-0550-8>.

</div>

<div id="ref-Patro">

Patro, Rob, Geet Duggal, Michael I. Love, Rafael A. Irizarry, and Carl
Kingsford. 2017. “Salmon Provides Fast and Bias-Aware Quantification of
Transcript Expression.” *Nature Methods* 14 (4): 417–19.
<https://doi.org/10.1038/nmeth.4197>.

</div>

<div id="ref-Soneson">

Soneson, Charlotte, Michael I. Love, and Mark D. Robinson. 2015.
“Differential Analyses for RNA-Seq: Transcript-Level Estimates Improve
Gene-Level Inferences.” *F1000Research* 4 (December): 1521–1.
<https://pubmed.ncbi.nlm.nih.gov/26925227>.

</div>

</div>
