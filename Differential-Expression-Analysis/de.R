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

dds <- dds[keep,]
dds <- DESeq(dds)
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
write.csv(deAnnotated, file = "deAnnotated.csv") 
# write the result to csv file 
