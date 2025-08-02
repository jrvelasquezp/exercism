def proteins(strand):
    stop_codons=["UAA","UAG","UGA"]
    codons_list=["AUG","UUU","UUC","UUA","UUG",
                 "UCU","UCC","UCA","UCG","UAU",
                 "UAC","UGU","UGC","UGG"]
    protein_list=["Methionine", 
                  "Phenylalanine", 
                  "Phenylalanine",
                  "Leucine",
                  "Leucine",
                  "Serine",
                  "Serine",
                  "Serine",
                  "Serine",
                  "Tyrosine",
                  "Tyrosine",
                  "Cysteine",
                  "Cysteine",
                  "Tryptophan"]
    number_of_codons=int(len(strand)/3)
    proteins=[]
    stop_transcription=False
    for i in range(number_of_codons):
        codon=strand[3*i:3*i+3]
    #Find stop codons
        for j in range(3):
            if codon==stop_codons[j]:
                stop_transcription=True
                break
    #Find normal codons
        if not stop_transcription:
            for j in range(14):
                if codon==codons_list[j]:
                    proteins.append(protein_list[j])


    return proteins