using System;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand)
    {
        int numberOfCodons=(int)(strand.Length/3);
        string[] codonList = new string[numberOfCodons];
        string[] proteinList = new string[numberOfCodons];
        for(int i=0;i<numberOfCodons;i++)
        {
            codonList[i]=strand.Substring(3*i,3);    
        }
        //find stop codons
        for (int i=0;i<numberOfCodons;i++)
        {
            if(codonList[i]=="UGA" || codonList[i]=="UAG" || codonList[i]=="UAA")
            {
                i=numberOfCodons+1;
            }
            else
            {
                Console.WriteLine(codonList[i]);
                switch(codonList[i])
                {
                    case "AUG":
                        proteinList[i]="Methionine";
                        break;
                    case "UGG":
                        proteinList[i]="Tryptophan";
                        break;
                    case "UUU": case "UUC":
                        proteinList[i]="Phenylalanine";
                        break;
                    case "UUA": case "UUG":
                        proteinList[i]="Leucine";
                        break;
                    case "UAU": case "UAC":
                        proteinList[i]="Tyrosine";
                        break;
                    case "UGU": case "UGC":
                        proteinList[i]="Cysteine";
                        break;
                    case "UCU": case "UCC": case "UCA": case "UCG":
                        proteinList[i]="Serine";
                        break;
                    default:
                        //proteinList[i]="Yonofui";
                        break;
                }
            }
        }
    return Array.FindAll(proteinList, i => i != null);
    }
}