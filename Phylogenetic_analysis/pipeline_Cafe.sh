python ~/software/CAFE/cafetutorial_prep_r8s.py -i RAxML_bestTree.tree -o r8s_ctl_file.txt -s 1286514 -p 'xigua,hulu' -c 20
~/software/r8s1.81/src/r8s -b -f r8s_ctl_file.txt > r8s_tmp.txt
python ~/software/CAFE/mcl2rawcafe.py -i ../mclOutput -o unfiltered_cafe_input.txt -sp "tiangua donggua gujiaolan luohanguo nangua huanggua grape xigua hulu"
~/software/CAFE/bin cafetutorial_run1.sh
