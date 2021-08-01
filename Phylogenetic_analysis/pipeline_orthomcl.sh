orthomclAdjustFasta Gp Gp.prot.fa 1
mkdir compliantFasta
mv *.prot.fa compliantFasta/
orthomclFilterFasta compliantFasta 10 20  // filt protein sequence
cat compliantFasta/*.fasta > all.fa
makeblastdb -in all.fa -out all.fa -dbtype prot
blastp -query all.fa -db all.fa -out result.txt -outfmt 6 -evalue 10e-6 -num_threads 30
orthomclBlastParser result.txt compliantFasta/ > similarSequence.txt
orthomclInstallSchema orthomcl.config.template 
orthomclLoadBlast orthomcl.config.template similarSequence.txt 
orthomclPairs orthomcl.config.template orthomcl_pairs.log cleanup=no
orthomclDumpPairsFiles orthomcl.config.template
mcl mclInput --abc -I 1.5 -o mclOutput