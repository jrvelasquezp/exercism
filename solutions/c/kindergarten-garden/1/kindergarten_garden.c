#include "kindergarten_garden.h"
#include <string.h>

plants_t plants(const char *garden, const char *student){
    plants_t student_plant;
    student_plant.plants[0]=get_plant(*(garden+2*number_of_student(student)));
    student_plant.plants[1]=get_plant(*(garden+2*number_of_student(student)+1));
    student_plant.plants[2]=get_plant(*(garden+2*number_of_student(student)+1+strlen(garden)/2));
    student_plant.plants[3]=get_plant(*(garden+2*number_of_student(student)+2+strlen(garden)/2));
    return student_plant;
}

plant_t get_plant(char letter){
    plant_t plant;
    switch (letter) {
        case 'C':
            plant=CLOVER;
            break;
        case 'G':
            plant=GRASS;
            break;
        case 'R':
            plant=RADISHES;
            break;
        case 'V':
            plant=VIOLETS;
            break;
    }
    return plant;
}

int number_of_student(const char *student){
    int num_student;
    if (strcmp(student,"Alice")==0) num_student=0;
    else if (strcmp(student,"Bob")==0) num_student=1;
    else if (strcmp(student,"Charlie")==0) num_student=2;
    else if (strcmp(student,"David")==0) num_student=3;
    else if (strcmp(student,"Eve")==0) num_student=4;
    else if (strcmp(student,"Fred")==0) num_student=5;
    else if (strcmp(student,"Ginny")==0) num_student=6;
    else if (strcmp(student,"Harriet")==0) num_student=7;
    else if (strcmp(student,"Ileana")==0) num_student=8;
    else if (strcmp(student,"Joseph")==0) num_student=9;
    else if (strcmp(student,"Kincaid")==0) num_student=10;
    else if (strcmp(student,"Larry")==0) num_student=11;
    return num_student;
}
