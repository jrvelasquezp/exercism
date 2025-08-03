class Squares {
    var number : Int = 0
    var squareOfSum : Int = 0
    var sumOfSquares : Int = 0
    var differenceOfSquares : Int = 0
    init(_ number: Int){
        self.number = number
        sumOfSqs()
        sqOfSum()
        diffOfSqs()
    }

    func sumOfSqs() {
        for i in 1...self.number {
            self.sumOfSquares = self.sumOfSquares + i*i 
        }
    }

    func sqOfSum() {
        for i in 1...self.number {
            self.squareOfSum = self.squareOfSum + i 
        }
        self.squareOfSum=self.squareOfSum*self.squareOfSum
    }
    
    func diffOfSqs() {
        self.differenceOfSquares = self.squareOfSum - self.sumOfSquares
    }
}
