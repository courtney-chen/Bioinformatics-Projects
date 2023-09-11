#!/usr/bin/env Rscript
# mergeAll.R

blast <-read.table("alignPredicted.txt", sep="\t", header=FALSE, quote="")

colnames(blast) <- c("qseqid", "sacc", "qlen", "slen","length", "nident", "pident", "evalue", "stitle")

blast$cov <- blast$nident/blast$slen

blast <- subset(blast, cov > .9, select=-c(stitle))

kegg <- read.table("kegg.txt", sep="\t", header=FALSE)

colnames(kegg) <- c("sacc", "kegg")

kegg$sacc <- gsub("up:", "", kegg$sacc)

blast_kegg <- merge(blast, kegg)

#print (paste0("Printing Merged blast & kegg: blast_kegg"))

# head (blast_kegg)

go <- read.csv("/data/METHODS/Fall/sp_go.txt", sep="\t", header=FALSE) 

colnames(go) <- c("sacc", "go")

#print(paste0("Printing head of sp_go.txt"))
head(go)

blast_kegg_go <- merge(blast_kegg, go)
print(paste0("Printing Merged blast_kegg & go: blast_kegg_go"))
head(blast_kegg_go)

ko <- read.table("ko.txt", sep="\t", header=FALSE)
colnames(ko) <- c("kegg", "ko")
print(paste0("Printing head of ko.txt"))
head(ko)

path <- read.table("path.txt", sep="\t", header=FALSE)
colnames(path) <- c("ko", "path")
print(paste0("Printing head of path.txt"))
head(path)

desc <- read.table("ko", sep="\t", header=FALSE)
colnames(desc) <- c("path", "desc")
print(paste0("Printing head of ko"))
head(desc)

blast_ko <- merge(blast_kegg_go, ko)
print(paste0("Printing Merged blast_kegg_go & ko: blast_ko"))
head(blast_ko)

blast_path <- merge(blast_ko, path)
print(paste0("Printing Merged blast_ko & path: blast_path"))
head(blast_path)

blast_desc <- merge(blast_path, desc)
print(paste0("Printing Merged blast_path & desc: blast_desc"))
head(blast_desc)
write.csv(blast_desc, file="blast_desc.csv")

