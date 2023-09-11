## Method

In this assignment, we learn to use DeepVariant (Poplin et al. 2018), a
deep learning-based variant caller, to identify the germline variant
from the sequencing data. Germline variants calling compares the genetic
differences between individuals of the same species. It is based on a
germline cohort callset. DeepVariant does not work out for somatic data.
Somatic variants calling is based on a single individual, it identifies
the genomic difference between tissues in the same single individual.

There are three main steps involved in variant calling (id variants from
the sequencing data). The first step is to perform the whole genome or
whole exome sequencing to obtain the sequencing data file, the FASTQ
file. The second step is to align the obtained sequencing result to a
reference genome and create BAM or CRAM files (McKenna et al. 2010). The
third step is the variant calling – identifying the difference between
the sequencing results and the reference genome, then write the results
to a Variant Call Format (VCF) file. Further steps involve variant
analysis and prediction of the effect. Effects of variant may result in
the change of a coding region or transcription factor binding site. The
structure and function of the protein might change due to the extent of
variation and the type of protein.

Overall, variant identification and analysis with variant callers does
give researchers an insight to the genomic differences. The results
yielded from bioinformatics tools should be tested with experiment for
further validation.

The assignment aligns the NGS reads from the paper “Comparison of three
variant callers for human whole genome sequencing” by Supernat et.al
with the reference genome obtained from GenBank database to identify the
genomic differences and generate a VCF file using DeepVariant. There are
eight scripts involved, which will be explained in detail below.

1.  getGenome.sh This script obtains the reference genome of GRCh38 from
    the online database using wget command with -c option, which is a
    helpful command to resume download when downloading a large file.
    The -O command saves the downloaded reference genome file under a
    different name – GRCh38\_referGRCh38\_reference.fa.gzence.fa.gz.
    getGenome.err and getGenome.log files are generated to better
    monitor the script.

2.  getReads.sh This script downloads the NGS reads in the paper, using
    the provided RSA number with the command fastq-dump. Two parameters
    –split-files are used to dump each read into separate files with
    suffix corresponding to read number. getReads.log and getReads.err
    are generated along. Two fastq files of SRR6808334 are generated
    after running this code.

3.  trimReads.sh This script uses Trimmomatic (Bolger, Lohse, and Usadel
    2014) to trim the NGS reads (SRR6808334) that we just downloaded.
    The shell command nice -n 19 gives this script lower priority for
    the server. Since Trimmomatic is a java program, java -jar command
    is listed to run java jar file, Trimmomatic, in
    /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar. PE is the
    parameter indicates our files have paired end reads. -thread 1 means
    only one server thread is used for running this job; -phred33 means
    the quality encoding method used for the reads. SRR6808334\_1.fastq
    and SRR6808334\_2.fastq are the two parameters, the NGS reads fastq
    files. The next four parameters are the paired and unpaired output
    files. Unpaired files contain the mate read was deleted because of
    the low quality. HEADCROP: 0 indicates no base is removed no matter
    what the quality is.

Here are some main steps in trimming. ILLUMINACLIP indicates the file of
the Trimmomatic, and the number of mismatches allowed in an adapter
match. LEADING: 20 is for cutting bases off the start of the read if it
is below 20. TRAILING:20 is for cutting bases off the end of the read if
it is below the threshold quality 20. SLIDINGWINDOW: 4:30 performs a
sliding window approach with the window size of 4, starting from the 5’,
ending when the average quality within the window falls below 30. The
minimum length to keep, MINLEN is 36.

4.  indexGenome.sh This script uses BWA (Li and Durbin 2009) to make an
    index of the reference genome, GRCh38\_reference.fa, in fasta format
    with the command bwa index, followed by option -a and its value
    bwtsw, which works for long genome in our case.

5.  alignReads.sh This script uses bwa mem to perform local alignment
    and produces alignment for different part of the NGS sequence. bwa
    mem support long-read and sliplt alignment. It is faster and more
    accurate, and good for high-quality queries. In the script, -t 8
    means the 8 threads on the server is used for running this script.
    -R
    “(<span class="citeproc-not-found" data-reference-id="RG">**???**</span>):SRR6808334:bar”
    means complete read group header line. The read group ID, SRR6808334
    will be attached to every read in the output. -p is an option that
    assumes the first input query file is interleaved (fixed number of
    characters per line) paired-end fasta. The first file is the index
    for the reference genome generated from indexGenome.sh. The second
    and third files are the NGS reads.

6.  sort.sh This script sorts the file created by bwa mem to a sorted
    bam file, which is a generic format for storing large sequence
    alignments. The alignments are sorted by leftmost coordinates. @ -8
    means 8 numbers of threads of sorting and compression. -m 4G
    indicates approximately the maximum required memory per thread.
    SRR6808334.sam is the input file, and -o SRR6808334.bam is the
    output file.

7.  indexReads.sh This script creates a coordinate-sorted BAI index for
    fast random access. This index is used when region arguments are
    used to limit samtools view, and similar commands to some specific
    targeted regions. This helps prepare for the variant calling later.

8.  runDeepVariant.sh This script does germline variant calling using
    DeepVariant to identify the differences between the reference genome
    and the NGS data from the paper and produce a VCF file for further
    analysis. set -euo pipefail means that the program will exit if any
    command or pipe exits with a non-zero status. The first part of the
    script, from line 7- line 24, configures the DeepVariant environment
    variables. Line 22 – line 24 creates the local directory of input
    and output. Line 27 - line 46 update docker community edition, if
    the docker was not found in PATH. From line 49 to line 54, indexed
    reference genome, BAM and BAI file of the NGS results are copied to
    the input directory created in line 10. line 57 pulls the docker
    image. line 59 to line 72 runs the DeepVariant command and yield the
    final VCF file.

## References

<div id="refs" class="references">

<div id="ref-Bolger">

Bolger, Anthony M., Marc Lohse, and Bjoern Usadel. 2014. “Trimmomatic: A
Flexible Trimmer for Illumina Sequence Data.” *Bioinformatics (Oxford,
England)* 30 (15): 2114–20.
<https://doi.org/10.1093/bioinformatics/btu170>.

</div>

<div id="ref-Li">

Li, Heng, and Richard Durbin. 2009. “Fast and Accurate Short Read
Alignment with Burrows-Wheeler Transform.” *Bioinformatics (Oxford,
England)* 25 (14): 1754–60.
<https://doi.org/10.1093/bioinformatics/btp324>.

</div>

<div id="ref-McKenna">

McKenna, Aaron, Matthew Hanna, Eric Banks, Andrey Sivachenko, Kristian
Cibulskis, Andrew Kernytsky, Kiran Garimella, et al. 2010. “The Genome
Analysis Toolkit: A MapReduce Framework for Analyzing Next-Generation
DNA Sequencing Data.” *Genome Research* 20 (9): 1297–1303.
<https://doi.org/10.1101/gr.107524.110>.

</div>

<div id="ref-Poplin">

Poplin, Ryan, Pi-Chuan Chang, David Alexander, Scott Schwartz, Thomas
Colthurst, Alexander Ku, Dan Newburger, et al. 2018. “Creating a
Universal SNP and Small Indel Variant Caller with Deep Neural Networks.”
*bioRxiv*, January, 092890. <https://doi.org/10.1101/092890>.

</div>

</div>
