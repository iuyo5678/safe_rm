### Time-stamp: <2014-02-12 13:51:57 Wednesday by zhangguhua>
no_param()
{
    echo "rm : missing file operand"
}

undelfile()
{
	mv -i ~/.trash/$@ ./
}

trash()
{
    while getopts "dfirvR" opt
    do
        case $opt in
             * ) x=2;; 
        esac
    done

    shift $(( $OPTIND - 1))
    
    if [ $# = 0 ]
    then
	    no_param
    else
        for arg   
        do
            newname="$(basename "$arg").$(date "+%s")"
            mv $arg ~/.trash/$newname 
        done
    fi
    
}


cleartrash()
{
	read -p "clear sure?[n]" confirm
	[ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash
	[ $confirm == 'y' ] || [ $confirm == 'Y' ]  && mkdir ~/.trash
    
}
export trash
export undelfile
export cleartrash

mkdir -p ~/.trash
alias rm=trash  
alias r=trash  
alias rl='ls ~/.trash'
alias ur=undelfile
