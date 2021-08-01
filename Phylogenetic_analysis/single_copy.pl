#script for extracting single copy families from the result of Orthomcl
($in1,$out1)=@ARGV;
open IN, "$in1";
open OUT, ">$out1";
while (chomp($line=<IN>)) {
    $donggua=0;
    $grape=0;
    $gujiaolan=0;
    $huanggua=0;
    $hulu=0;
    $luohanguo=0;
    $nangua=0;
    $tiangua=0;
    $xigua=0;

    @tmp=split(" ",$line);
    foreach(@tmp){
        if ($_=~/donggua/ ) {
            $donggua++;
        }
        if ($_=~/grape/ ) {
            $grape++;
        }
        if ($_=~/gujiaolan/ ) {
            $gujiaolan++;
        }
        if ($_=~/huanggua/ ) {
            $huanggua++;
        }
        if ($_=~/hulu/ ) {
            $hulu++;
        }
        if ($_=~/luohanguo/ ) {
            $luohanguo++;
        }
        if ($_=~/nangua/) {
            $nangua++;
        }
        if ($_=~/tiangua/ ) {
            $tiangua++;
        }
        if ($_=~/xigua/) {
            $xigua++;
        }
    }
    if ( $donggua==1 && $grape==1 && $gujiaolan==1 && $huanggua==1 && $hulu==1 && $luohanguo==1 && $nangua==1 && $tiangua==1 && $xigua==1) {
        $num++;
        print "$num\n";
        print OUT "$line\n";
    } 
}

