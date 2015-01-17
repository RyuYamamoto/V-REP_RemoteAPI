%|---------------------------------|
%|-@file    walk_cmd.m             |
%|-@brief   Transmit Walk Command  |
%|-@date    2015.1.23              |
%|-@author  Ryu Yamamoto           |
%|---------------------------------|
function walk_cmd(walk_patern)

    %Load Mat files
    load('data/Motion');
    load('data/walk_paramter_table.mat');
    
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
            %Target ZMP Trajectory[time,x,y,z_right,z_left]
            zmp_p = [ 0 0 0 20 20 ; 0.5 0 40 20 20 ; 0.75 0 40 up_leg_length 20 ; 1 0 -40 20 20 ; 1.25 0 -40 20 up_leg_length ; 1.5 0 40 20 20 ; 1.75 0 40 up_leg_length 20 ; 2 0 -40 20 20 ; 2.25 0 -40 20 up_leg_length ; 2.5 0 40 20 20 ; 2.75 0 40 up_leg_length 20 ; 3 0 -40 20 20 ; 3.25 0 -40 20 up_leg_length ; 3.5 0 40 20 20 ; 3.75 0 40 up_leg_length 20 ; 4 0 0 20 20 ; 100 0 0 20 20];
            motion_seq(zmp_p);
    end
end
