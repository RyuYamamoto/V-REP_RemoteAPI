%|---------------------------------|
%|-@file    walk_cmd.m             |
%|-@brief   Transmit Walk Command  |
%|-@date    2015.1.23              |
%|-@author  Ryu Yamamoto           |
%|---------------------------------|
function walk_cmd(walk_patern)

    %Load Mat files
    load('data/Motion');
    load('data/walk_parameter_table.mat');
    
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
            ready_pos = [0 0 offset ; 0 0 offset];
            ready_ang_upper = [ArmR ArmL];
            ready_ang_lower = Cal_Inv_Kine(ready_pos);
            Servo_OutPut(ready_ang_lower,ready_ang_upper,0.05);
            pause(2);
        case STEP       %Step
            zmp_p = [0 0 0;0.5 0 44 ;1 0 -44;1.5 0 44;2 0 -44;2.5 0 44;3 0 -44;3.5 0 44;4 0 0;100 0 0];   %Goal Foot Position
            zmp_p = [ 0 0 0 offset offset ;
                      0.5 0 max_zmp_y 20 20 ;
                      0.75 0 max_zmp_y up_leg_length+offset offset ; 
                      1 0 min_zmp_y offset offset ;
                      1.25 0 min_zmp_y offset up_leg_length+offset ;
                      1.5 0 max_zmp_y offset offset ;
                      1.75 0 max_zmp_y up_leg_length+offset offset ;
                      2 0 min_zmp_y offset offset ;
                      2.25 0 min_zmp_y offset up_leg_length+offset ;
                      2.5 0 max_zmp_y offset offset ;
                      2.75 0 max_zmp_y up_leg_length+offset offset ;
                      3 0 min_zmp_y offset offset ;
                      3.25 0 min_zmp_y offset up_leg_length+offset ; 
                      3.5 0 max_zmp_y offset offset ; 
                      3.75 0 max_zmp_y up_leg_length+offset offset ;
                      4 0 min_zmp_y offset offset ;
                      4.25 0 min_zmp_y offset up_leg_length+offset ;
                      4.5 0 max_zmp_y offset offset ;
                      4.75 0 max_zmp_y offset+up_leg_length offset ; 
                      5 0 0 offset offset ; 100 0 0 offset offset];
%             zmp_p = [ 0 0 0 offset offset ;
%                       0.5 0 max_zmp_y up_leg_length+offset offset ;
%                       0.75 0 max_zmp_y up_leg_length+offset offset ;
%                       1 0 min_zmp_y offset up_leg_length+offset ;
%                       1.25 0 min_zmp_y offset up_leg_length+offset ;
%                       1.5 0 max_zmp_y up_leg_length+offset offset ;
%                       1.75 0 max_zmp_y up_leg_length+offset offset ;
%                       2 0 min_zmp_y offset up_leg_length+offset ;
%                       2.25 0 min_zmp_y offset up_leg_length+offset ;
%                       2.5 0 max_zmp_y up_leg_length+offset offset ;
%                       2.75 0 max_zmp_y up_leg_length+offset offset ;
%                       3 0 min_zmp_y offset up_leg_length+offset ;
%                       3.25 0 min_zmp_y offset up_leg_length+offset ;
%                       3.5 0 max_zmp_y up_leg_length+offset offset ;
%                       3.75 0 max_zmp_y up_leg_length+offset offset ;
%                       4 0 0 offset offset ;
%                       100 0 0 offset offset];
            motion_seq(zmp_p);
    end
end
