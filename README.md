## Биоинформатика

Ссылка на прочтения: https://www.ncbi.nlm.nih.gov/sra/SRX12633907[accn]
(WGS of Escherichia coli, ILLUMINA (Illumina MiSeq))

Скрипт поддерживает парные прочтения (напр. с прибора Illumina).

Перед запуском скрипта рекомендуется добавить к имени файла окончание-порядковый номер прочтения (_1 или _2). Скрипт автоматически определит наличие второго файла и произведет необходимые вычисления с ним.

Результат работы программы `samtools flagstat` (data/21SD09GB05-EC_S16_L001_samtools.txt):
```
1770041 + 0 in total (QC-passed reads + QC-failed reads)
0 + 0 secondary
12473 + 0 supplementary
0 + 0 duplicates
1554948 + 0 mapped (87.85% : N/A)
1757568 + 0 paired in sequencing
878784 + 0 read1
878784 + 0 read2
1534876 + 0 properly paired (87.33% : N/A)
1539286 + 0 with itself and mate mapped
3189 + 0 singletons (0.18% : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)
```

Пример запуска: 
```
. ./pipeline.sh ./data/21SD09GB05-EC_S16_L001 ./data/GCF_0000058452_ASM584v2_genomic
```