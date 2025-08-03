module ProteinTranslation

let proteins rna =
    let dict = 
        Map.empty.
            Add("AUG", "Methionine").
            Add("UUU", "Phenylalanine").
            Add("UUC", "Phenylalanine").
            Add("UUA", "Leucine").
            Add("UUG", "Leucine").
            Add("UCU", "Serine").
            Add("UCC", "Serine").
            Add("UCG", "Serine").
            Add("UCA", "Serine").
            Add("UGU", "Cysteine").
            Add("UGC", "Cysteine").
            Add("UAU", "Tyrosine").
            Add("UAC", "Tyrosine").
            Add("UGG", "Tryptophan")
    
    let (chain: string) = rna
    let (length: int32) = chain.Length
    let codons = length / 3
    let mutable (response: string) = ""
    let mutable codons_list=[]
    let mutable proteins_list=[]
    if length < 3 then
        codons_list <- [sprintf "%i" length]
    else
        for i=0 to codons-1 do
            codons_list <- chain.Substring(3*i,3) :: codons_list
    
    codons_list <- List.rev codons_list

    let mutable (stop_position: int) = 0
    let is_stop_codon s = s = "UAG" || s = "UAA" || s = "UGA"
    stop_position <- 
        match List.tryFindIndex is_stop_codon codons_list with
        | Some value -> value
        | None  -> codons
    for i=0 to stop_position-1 do
        proteins_list <- dict.[codons_list.Item(i)] :: proteins_list
    proteins_list <- List.rev proteins_list
    proteins_list
