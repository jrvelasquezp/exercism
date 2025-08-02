export function valid(digitString: string): unknown {
  let validLuhn: boolean = false
  let luhnString: string = digitString.replace(/\s/g, '')
  let sum: number=0
  let luhnLen: number = luhnString.length
  if (isNaN(parseInt(luhnString))) {
    validLuhn = false
  }
  else {
    if (luhnLen == 1){
      validLuhn = false
    }
    else {
      for (let i = 0; i < luhnLen; i++) {
        let digit = Number(luhnString.charAt(luhnLen-i-1))
        if (i % 2 !=0){
          digit=digit*2
          if (digit > 9){
            digit=digit-9
          }
        }
        sum=sum+digit
      }
      if (sum % 10 == 0){
        validLuhn=true
      }
    }
  }
  return validLuhn
}
