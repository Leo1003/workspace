unalias -a
for file in ${D}/alias/*.sh
do
    . $file
done
alias aliasf='alias | grep'
