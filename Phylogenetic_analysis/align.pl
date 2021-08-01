#script for align protein sequences based on coalescent mnthod
use Bio::SeqIO;
use  Bio::Seq;
@spe=("donggua","grape","gujiaolan","huanggua","hulu","luohanguo","nangua","tiangua","xigua");
($in,$out)=@ARGV;
foreach(@spe){
    $file1=$_.".fasta";
    my $catchseq_seqio_obj1 = Bio::SeqIO->new(-file=>"<$file1", -format=>'fasta');  
    while(my $seq_obj = $catchseq_seqio_obj1->next_seq){
        $id=$seq_obj->display_name;
        $seq=$seq_obj->seq;
        $prot=$_."_prot";
        $$prot{$id}=$seq;
    }
}
open IN, "$in";

while (chomp($line=<IN>)) {
    open OUT1,">tmp_prot.txt";
    @tmp=split(" ",$line);
    foreach(@tmp){
        @tmp2=split/\|/,$_;
        $spe=$tmp2[0];
        $prot=$spe."_prot";
        if (exists($$prot{$_})) {
            print OUT1 ">$spe\n";
            print OUT1 "$$prot{$_}\n";
        }
    }
    close OUT1;
    system("muscle -in tmp_prot.txt -out tmp_align_prot.txt");
 #   system("perl convert_pro_cds.pl");
 #   system("Gblocks tmp_align_cds.txt -t=c -b4=5 -b5=h");
    my $catchseq_seqio_obj1 = Bio::SeqIO->new(-file=>"<tmp_align_prot.txt", -format=>'fasta');  
    while(my $seq_obj = $catchseq_seqio_obj1->next_seq){
        $id=$seq_obj->display_name;
        $seq=$seq_obj->seq;
        $hash_final{$id}=$hash_final{$id}.$seq;
    }
}
open OUT, ">final_align.txt";
foreach(keys(%hash_final)){
    print OUT ">$_\n";
    print OUT "$hash_final{$_}\n";
}
close OUT;

