#!/usr/bin/env Rscript
# de.R

library(tximport)
library(readr)
library(DESeq2)
library(knitr)
# this is the library that will disply formatted tables

tx2gene <- read.csv("tx2gene.csv")
head(tx2gene)

samples <- read.csv("/scratch/SampleDataFiles/Samples.csv", header=TRUE)
# read Sample.csv as samples
kable(head(samples))
# read the sample as table

files <- file.path("quant", samples$Sample, "quant.sf")
# read the quant.sf file
txi <- tximport(files, type = "salmon", tx2gene=tx2gene)
# import the salmon alignments save it as txi
# read in file

dds <- DESeqDataSetFromTximport(txi, colData = samples, design = ~ Menthol +Vibrio)
# import the Salmon alignments into DSeq2
# using counts and average transcript lengths from tximport
dds$Vibrio <- relevel(dds$Vibrio, ref = "Control")
dds$Menthol <- relevel(dds$Menthol, ref = "Control")
keep <- rowSums(counts(dds)) >= 10
# estimating size factors 
# using 'avgTxLength' from assays(adds), correcting for library size
# estimating dispersions
# gene-wise dispersion relationship
# final dispersion estimates
# fitting model and testing 

dds <- dds[keep,]
dds <- DESeq(dds)


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
        dfRes <- subset(dfRes, padj < 0.05)
        # filter to keep the data with pdaj < 0.05
        dfRes$Factor <- result
        # Factor in dfRes is result, which is all DE result except intercept
        dfAll <- rbind(dfAll, dfRes)
        # the final dfAll includes dataframe of dfAll, and dfRes, combine rows
    }
}
#kable(dfAll)
# ko is the column name
pathfile <- "/scratch/SampleDataFiles/Annotation/path.txt"
table_path <- read.table(pathfile, sep = '\t', header =FALSE)
colnames(table_path) <- "ko"
deAnnotated <- merge(dfAll, table_path)
kable(head(deAnnotated))
# write.csv(deAnnotated, file = "deAnnotated.csv") 
