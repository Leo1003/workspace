unalias -a
for file in ${DIR}/alias/*.sh
do
    . $file
done
alias aliasf='alias | grep'
