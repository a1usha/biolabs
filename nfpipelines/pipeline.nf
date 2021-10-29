#!/usr/bin/env nextflow

params.fastqBaseName = "$baseDir/../data/21SD09GB05-EC_S16_L001"
params.refPath = "$baseDir/../data/GCF_000005845.2_ASM584v2_genomic.fna"
params.outDir = "$baseDir/../out"

out_dir = file(params.outDir)
out_dir.mkdir()

Channel
    .fromPath ( params.fastqBaseName + "_*.fastq.gz" )
    .into { input_files_ch_1; input_files_ch_2 }

process runFastqc {
    cpus { 2 }

    input:
    file fastq from input_files_ch_1

    script:
    """
    fastqc --outdir ${params.outDir} \
        -t ${task.cpus} \
        $fastq
    mv ${out_dir.resolve(fastq.simpleName + "_fastqc.html")} ${out_dir.resolve(fastq.simpleName + ".html")}
    rm ${out_dir.resolve(fastq.simpleName + "_fastqc.zip")}
    """
}

process bwaIndex {

    input: 
    path "ref.fna" from params.refPath

    output:
    file "*.{amb,ann,bwt,pac,sa}" into bwa_index

    script:
    """
    bwa index ref.fna
    """ 
}

process bwaMem {
    cpus { 2 }

    input: 
    path "ref.fna" from params.refPath
    file "*" from bwa_index
    file fastq from input_files_ch_2.collect()

    output:
    file "*.sam" into bwa_mem

    script:
    """
    bwa mem -t ${task.cpus} ref.fna $fastq > result_bwamem.sam
    """
}

process smtFlagstat {

    input:
    file mem_res from bwa_mem

    output:
    path "*.txt" into samtools_flagstat

    script:
    """
    samtools flagstat $mem_res > flagstat_result.txt
    """
}

process extractQuality {
    input:
    path flagstat_result from samtools_flagstat

    output:
    stdout into result

    script:
    """
    echo \$( grep -oP '\\d+\\.\\d+' $flagstat_result | head -1 )">90" | bc
    """
}

result.subscribe { 
    if ( it.toInteger() == 1 )
        println("OK")
    else
        println("Not OK")
}
