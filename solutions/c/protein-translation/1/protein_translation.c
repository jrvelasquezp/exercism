#include "protein_translation.h"

int find_stop(char * rna){
    int codons = strlen(rna)/3;
	int i; 
	int stop_position=-1;
	char codon[4];
	for (i=0;i<codons;i++){
	    strncpy(codon,rna+3*i,3);
	    if(strcmp(codon,"UAA")==0 || strcmp(codon,"UAG")==0 || strcmp(codon,"UGA")==0){
	        stop_position=3*i;
	        i=codons+1;
	    }
	}
	return stop_position;
}

proteins_t proteins(const char *const rna){
    proteins_t protein;
    unsigned int i;
    char codon[4];
    //Condition 1. Test if string is empty
    if(strlen(rna)==0){
        protein.valid=true;
        protein.count=0;
    }
    //Condition 2. String incomplete and no stop
    else if (strlen(rna)%3!=0 && find_stop((char *)rna)==-1){
        protein.valid=false;
    }
    //Condition 3. Has stop at the beginning
    else if (find_stop((char *)rna)==0){
        protein.valid=true;
        protein.count=0;
    }
    else{
    //Condition 4. If there is a valid stop, count of proteins
    //is related to the stop position, otherwise is the length
        protein.valid=true;
        if (find_stop((char *)rna)>0){
            //protein.valid=true;
            protein.count=find_stop((char *)rna)/3;
        }
        else{
            //protein.valid=true;
            protein.count=strlen(rna)/3;          
        }
        for(i=0;i<protein.count;i++){
            //A. Get a single codon
            strncpy(codon,rna+3*i,3);
            //B. Trasnlate to valid codon
            if(strcmp(codon,"AUG")==0)
                protein.proteins[i]=Methionine;
            else if(strcmp(codon,"UGG")==0)
                protein.proteins[i]=Tryptophan;
            else if(strcmp(codon,"UUU")==0 || strcmp(codon,"UUC")==0)
                protein.proteins[i]=Phenylalanine;
            else if(strcmp(codon,"UUA")==0 || strcmp(codon,"UUG")==0)
                protein.proteins[i]=Leucine;
            else if(strcmp(codon,"UAU")==0 || strcmp(codon,"UAC")==0)
                protein.proteins[i]=Tyrosine;
            else if(strcmp(codon,"UGU")==0 || strcmp(codon,"UGC")==0)
                protein.proteins[i]=Cysteine;
            else if(strcmp(codon,"UCU")==0 || strcmp(codon,"UCC")==0 || strcmp(codon,"UCA")==0 || strcmp(codon,"UCG")==0)
                protein.proteins[i]=Serine;
            else{
                protein.valid=false;
                i=protein.count+1;
                protein.count=0;
            }
        }
    }
    return protein;
}
