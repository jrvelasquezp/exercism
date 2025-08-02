#include "yacht.h"

int score(dice_t dice, category_t category){
    int sum, final_score, i, fh1, fh2;
    int count[6]={0,0,0,0,0,0};
    sum=0;
    //psum=0;
    final_score=0;
    //calculate sum
    for (i=0;i<5;i++){
        sum=sum+dice.faces[i];
        count[dice.faces[i]-1]++;
    }
    if (category==YACHT){
        if (sum==5*dice.faces[0]) final_score=50;
    }
    else if (category==CHOICE){
        final_score=sum;
    }
    else if (category==FOUR_OF_A_KIND){
        for (i=0;i<6;i++){
            if (count[i]>=4) final_score=4*(i+1);
        }
    }
    else if (category==LITTLE_STRAIGHT){
        if (count[5]==0) {
            for (i=0;i<5;i++){
                if (count[i]>1) i=7;
            }
            if (i<7) final_score=30;
        }
    }
    else if (category==BIG_STRAIGHT){
        if (count[0]==0) {
            for (i=1;i<6;i++){
                if (count[i]>1) i=7;
            }
            if (i<7) final_score=30;
        }
    }
    else if (category==FULL_HOUSE){
        fh1=0;
        fh2=0;
        for (i=0;i<6;i++) {
            if ((count[i]==2 || count[i]==3) && (fh1==0 && fh2==0)) fh1=count[i];
            else if (count[i]==2 && fh1==3) fh2=count[i];
            else if (count[i]==3 && fh1==2) fh2=count[i];
        }
        if (fh1+fh2==5) final_score=sum;
    }
    else final_score=count[category]*(category+1);

    return final_score;
}
