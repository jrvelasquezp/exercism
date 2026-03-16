package proteintranslation

import (
	"errors"
    "fmt"
)

var ErrStop = errors.New("stop codon encountered")
var ErrInvalidBase = errors.New("invalid base")

var m map[string]string

func FromRNA(rna string) ([]string, error) {
	var error_msg error
	codon := ""
	var codons []string
	for i := 0; i < len(rna); i = i + 3 {
		if i+3 > len(rna) {
			codon = rna[i : len(rna)-1]
		} else {
			codon = rna[i : i+3]
		}
		value, err := FromCodon(codon)
        fmt.Println(codon, value, err)
        if err == ErrStop {
            return codons, nil
        } else if err == nil {
			codons = append(codons, value)
		} else {
			error_msg = err
		}
	}
	if error_msg==ErrStop || error_msg == nil {
    	return codons, nil    
    } else {
        return codons, error_msg
    }
}

func FromCodon(codon string) (string, error) {
	if codon == "UAA" || codon == "UAG" || codon == "UGA" {
		return "", ErrStop
	} else {
		m = make(map[string]string)
		m["AUG"] = "Methionine"
		m["UUU"] = "Phenylalanine"
		m["UUC"] = "Phenylalanine"
		m["UUA"] = "Leucine"
		m["UUG"] = "Leucine"
		m["UAU"] = "Tyrosine"
		m["UAC"] = "Tyrosine"
		m["UGU"] = "Cysteine"
		m["UGC"] = "Cysteine"
		m["UGG"] = "Tryptophan"
		m["UCU"] = "Serine"
		m["UCC"] = "Serine"
		m["UCA"] = "Serine"
		m["UCG"] = "Serine"
		elem, ok := m[codon]
		if ok == false {
			return "", ErrInvalidBase
		} else {
			return elem, nil
		}
	}
}
