#!/bin/bash

# This script checks the quality of our fastq files and performs an alignment to the human cDNA transcriptome reference with Kallisto.
# To run this 'shell script' you will need to open your terminal and navigate to the directory where this script resides on your computer.
# This should be the same directory where you fastq files and reference fasta file are found.
# Change permissions on your computer so that you can run a shell script by typing: 'chmod u+x readMapping.sh' (without the quotes) at the terminal prompt.
# Then type './readMapping.sh' (without the quotes) at the prompt.
# This will begin the process of running each line of code in the shell script.

# first use fastqc to check the quality of our fastq files:
fastqc *.gz -t 4

# next, we want to build an index from our reference fasta file
# I get my reference mammalian transcriptome files from here: https://useast.ensembl.org/info/data/ftp/index.html
kallisto index -i Homo_sapiens.GRCh38.cdna.all.index Homo_sapiens.GRCh38.cdna.all.fa.gz

# now map reads to the indexed reference host transcriptome
# use as many 'threads' as your machine will allow in order to speed up the read mapping process.
# use 30-60 bootstraps to model technical variance for each sample
# note that we're also including the '&>' at the end of each line
# this takes the information that would have been printed to the terminal, and outputs this in a log file that is saved in /data/course_data

samples=(
    "SRR8668755.fastq.gz"
    "SRR8668756.fastq.gz"
    "SRR8668757.fastq.gz"
    "SRR8668758.fastq.gz"
    "SRR8668759.fastq.gz"
    "SRR8668769.fastq.gz"
    "SRR8668771.fastq.gz"
    "SRR8668772.fastq.gz"
    "SRR8668773.fastq.gz"
    "SRR8668774.fastq.gz"
)

names=(
    #healthy subjects (HS)
    "HS01"
    "HS02"
    "HS03"
    "HS04"
    "HS05"
    
    #cutaneous leishmaniasis (CL)
    "CL08"
    "CL10"
    "CL11"
    "CL12"
    "CL13"
    
)

for i in "${!samples[@]}"; do
    echo "Processing ${samples[$i]} -> ${names[$i]}"

    kallisto quant \
        -i Homo_sapiens.GRCh38.cdna.all.index \
        -o "${names[$i]}" \
        -t 8 \
        --single \
        -l 250 \
        -s 30 \
        "${samples[$i]}" &> "${names[$i]}.log"
done

# summarize fastqc and kallisto mapping results in a single summary html using MultiQC
multiqc -d .

echo "Finished"
