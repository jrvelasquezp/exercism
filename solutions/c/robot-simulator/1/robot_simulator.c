#include "robot_simulator.h"
#include <string.h>

robot_status_t robot_create(robot_direction_t direction, int x, int y){
    robot_status_t new_robot;
    new_robot.direction=direction;
    new_robot.position.x=x;
    new_robot.position.y=y;
    return new_robot;
}
void robot_move(robot_status_t *robot, const char *commands){
    int x,y;
    unsigned int i;
    robot_position_t pos=robot->position;
    x=pos.x;
    y=pos.y;
    //do this part for all the characters in the string
    if(strlen(commands)>0){
        for(i=0;i<strlen(commands);i++){
            //rotational part
            if(*(commands+i)=='R' && robot->direction!=DIRECTION_WEST){
                robot->direction++;
            }
            else if(*(commands+i)=='R' && robot->direction==DIRECTION_WEST){
                robot->direction=DIRECTION_NORTH;     
            }
            else if(*(commands+i)=='L' && robot->direction!=DIRECTION_NORTH){
                robot->direction--;
            }
            else if(*(commands+i)=='L' && robot->direction==DIRECTION_NORTH){
                robot->direction=DIRECTION_WEST;     
            }
            //movement part
            else if(*(commands+i)=='A'){
                switch(robot->direction){
                    case DIRECTION_NORTH:
                        y++;
                        break;
                    case DIRECTION_EAST:
                        x++;
                        break;
                    case DIRECTION_SOUTH:
                        y--;
                        break;
                    case DIRECTION_WEST:
                        x--;
                        break;
                    case DIRECTION_MAX:
                        break;
                }
            }
        }
        
    }
    pos.x=x;
    pos.y=y;
    robot->position=pos;
}