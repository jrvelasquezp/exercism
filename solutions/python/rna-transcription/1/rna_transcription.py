def to_rna(dna_strand):
    rna=""
    for character in dna_strand:
        if character == 'A':
            rna=rna+'U'
        elif character == 'T':
            rna=rna+'A'
        elif character == 'C':
            rna=rna+'G'
        elif character == 'G':
            rna=rna+'C'
    return rna
