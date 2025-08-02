class AllYourBase {
    private int inputBase
    private int number
    private def digits=[]
    AllYourBase(inputBase, digits) {
        if (inputBase<2){
            throw new java.lang.ArithmeticException('Input base lower than 2')
        }
        else{
            this.inputBase=inputBase
            this.digits=digits
            this.number=0
            if (this.digits.size()>0){
                listToNumber()    
            }
        }
    }

    def rebase(outputBase) {
        def outDigits=[]
        if (outputBase<2){
            throw new java.lang.ArithmeticException('Output base lower than 2')
        }
        else{
            while (this.number >= outputBase){
                outDigits.add(this.number % outputBase)
                this.number=this.number.intdiv(outputBase)
            }
            outDigits.add(this.number % outputBase)
            if (this.number == outputBase) {
                outDigits.add(this.number.intdiv(outputBase))
            }
        }
        return outDigits.reverse()
    }

    def listToNumber(){
        def digit=0
        for (i in 0..this.digits.size()-1){
            digit=this.digits.reverse().get(i)
            if(digit<0){
                throw new java.lang.ArithmeticException('Negative digit')
            }
            else if(digit>=this.inputBase){
                throw new java.lang.ArithmeticException('Invalid positive digit')
            }
            else{
                this.number=this.number+digit*(inputBase**i)    
            }
        }
    }
}