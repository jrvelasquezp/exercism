BEGIN {
    getline number
    sum=0
    # preprocessing
    gsub(" ","",number)
    # match if there are non number characters
    if (number ~ /[a-zA-Z]/ || number ~ /[[:punct:]]/) {
        print "false"
    }
    # discard strings with single digit
    else if (length(number)==1)
    {
        print "false"
    }
    # validate Luhn algorithm
    else {
        for (i=1;i<=length(number);++i){
            digit = strtonum(substr(number,length(number)-i+1,1))
            if (i % 2 == 0){
                digit = 2 * digit
                if (digit > 9) {
                    digit = digit - 9
                }
            }
            sum=sum + digit
        }
        if (sum % 10 == 0) {
            print "true"
        }
        else {
            print "false"
        }
    }

}
