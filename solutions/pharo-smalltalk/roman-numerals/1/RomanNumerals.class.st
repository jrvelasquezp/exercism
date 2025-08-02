Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

RomanNumerals >> romanNumber: number [
    number >= 1000 ifTrue: [^ 'M', (self romanNumber: number - 1000)].
    number >= 900 ifTrue: [^ 'CM', (self romanNumber: number - 900)].
    number >= 500 ifTrue: [^ 'D', (self romanNumber: number - 500)].
    number >= 400 ifTrue: [^ 'CD', (self romanNumber: number - 400)].
    number >= 100 ifTrue: [^ 'C', (self romanNumber: number - 100)].
    number >= 90 ifTrue: [^ 'XC', (self romanNumber: number - 90)].
    number >= 50 ifTrue: [^ 'L', (self romanNumber: number - 50)].
    number >= 40 ifTrue: [^ 'XL', (self romanNumber: number - 40)].
    number >= 10 ifTrue: [^ 'X', (self romanNumber: number - 10)].
    number >= 9 ifTrue: [^ 'IX', (self romanNumber: number - 9)].
    number >= 5 ifTrue: [^ 'V', (self romanNumber: number - 5)].
    number >= 4 ifTrue: [^ 'IV', (self romanNumber: number - 4)].
    number >= 1 ifTrue: [^ 'I', (self romanNumber: number - 1)].
    number <= 0 ifTrue: [^ ''].
]
        

          

    