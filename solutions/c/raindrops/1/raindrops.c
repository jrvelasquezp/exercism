#include "raindrops.h"

void convert(char result[], int drops){
    int div_3=0;
    int div_5=0;
    int div_7=0;
    if (drops%3==0 || drops%5==0 || drops%7==0){
        if(drops%3==0)
            div_3=3;
        if(drops%5==0)
            div_5=5;
        if(drops%7==0)
            div_7=7;
        switch(div_3+div_5+div_7){
            case 3:
                sprintf(result,"Pling");
                break;
            case 5:
                sprintf(result,"Plang");
                break;
            case 7:
                sprintf(result,"Plong");
                break;
            case 8:
                sprintf(result,"PlingPlang");
                break;
            case 10:
                sprintf(result,"PlingPlong");
                break;
            case 12:
                sprintf(result,"PlangPlong");
                break;
            case 15:
                sprintf(result,"PlingPlangPlong");
                break;
        }      
    }
    else{
        sprintf(result,"%d",drops);    
    }
}
