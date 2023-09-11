## Overview

In this module we identify the differential expression of genes. Two
main steps are involved to achieve it – retrieve the data of relative
abundance of transcripts, then apply statistical models to examine the
differential expression between treatment groups.

In the first step, Salmon (Patro et al. 2017) is used to estimate the
relative abundance of transcripts. With the help of tximport (Soneson,
Love, and Robinson 2015), data can be imported for DESeq2 (Love, Huber,
and Anders 2014) to achieve the second step, running the statistical
test.

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
