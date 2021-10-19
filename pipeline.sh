#!/bin/bash

run_fastqc() {
	fastqc $1.fastq.gz
	mv $1_fastqc.html $1.html
	rm $1_fastqc.zip
}

extract_quality() {
	return $( echo $(cat $1 | grep -oP '\d+\.\d+' | head -1)">90" | bc )
}

bwa index $2.fna

if test -f $1_2.fastq.gz; then
	run_fastqc $1_1
	run_fastqc $1_2
	bwa mem $2.fna $1_1.fastq.gz $1_2.fastq.gz > $1.sam
else 
	run_fastqc $1_1
	bwa mem $2.fna $1_1.fastq.gz > $1.sam
fi

samtools flagstat $1.sam > $1_samtools.txt

extract_quality $1_samtools.txt
if [[ "$?" -eq 1 ]]; then
	echo "OK"
else
	echo "Not OK"
fi