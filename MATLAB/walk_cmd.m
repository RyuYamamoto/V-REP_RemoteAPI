%Recive walk command
%param  walk_patern:Motino Pattern
%return no
function walk_cmd(walk_patern)
    load('data/Motion');
    
    switch walk_patern
        case STRAIGHT   %Straight  
            straight_pos = [0 0 0 ; 0 0 0];
            straight_ang = cal_inv_kine(straight_pos);
            disp('Servo Output Straight');
            Servo_OutPut(straight_ang,0.05);
        case READY      %Ready  
            ready_pos = [0 0 20 ; 0 0 20];
            ready_ang = cal_inv_kine(ready_pos);
            Servo_OutPut(ready_ang,0.05);
        case STEP       %Step
            zmp_p = [0 0 0;0.5 0 44 ;1 0 -44;1.5 0 44;2 0 -44;2.5 0 44;3 0 -44;3.5 0 44;4 0 0;100 0 0];   %Goal Foot Position
            motion_seq(zmp_p);
%         case FRONT      %Walk Front
%         case BACK       %Walk Back
%         case RIGHT      %Right Turn
%         case LEFT       %Left Turn
    end
end
