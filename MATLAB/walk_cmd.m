%|---------------------------------|
%|-@file    walk_cmd.m             |
%|-@brief   Transmit Walk Command  |
%|-@date    2015.1.23              |
%|-@author  Ryu Yamamoto           |
%|---------------------------------|
function walk_cmd(walk_patern)
    load('data/Motion');
    
    switch walk_patern
        case STRAIGHT   %Straight  
            straight_pos = [0 0 0 ; 0 0 0];
            straight_ang_upper = [0 0];
            straight_ang_lower = Cal_Inv_Kine(straight_pos);
            Servo_OutPut(straight_ang_lower,straight_ang_upper,0.05);
            pause(2);
        case READY      %Ready  
            ready_pos = [0 0 20 ; 0 0 20];
            ready_ang_upper = [10 -10];
            ready_ang_lower = Cal_Inv_Kine(ready_pos);
            Servo_OutPut(ready_ang_lower,ready_ang_upper,0.05);
            pause(2);
        case STEP       %Step
            zmp_p = [0 0 0;0.5 0 44 ;1 0 -44;1.5 0 44;2 0 -44;2.5 0 44;3 0 -44;3.5 0 44;4 0 0;100 0 0];   %Goal Foot Position
            motion_seq(zmp_p);
    end
end
