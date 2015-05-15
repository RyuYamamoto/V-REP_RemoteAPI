%Calulation InvertKinematics using Preview Control(COG) function
%param      tar_cog:COG Trajectory  tar_zmp:Target ZMP
%return     cog_angle:angle from OCG  zmp_angle:angle fromZMP
function [g1 g2] = cal_inv_kine_pc(cog_x,cog_y,output_zmp_x,output_zmp_y)
    load('data/walk_paramter_table');
    
    %Link Parameter
    L0  = 41;
    L1  = 105;
    L12 = 41;
    L2  = 105;
    L3  = 43.5;
    
    %Leg Length
    L   = L0 + L1 + L12 + L2 + L3;
    
    %Invert Kinematics
    
    %Using Center of Gravity
	g1 = atan(cog_y/(L-L3));		%hip roll
	g2 = atan(cog_y/(L-L3));		%foot roll
    g1 = g1 * 180 / 3.14;
    g2 = g2 * 180 / 3.14;
% 	cog_angle = [g1 g2];

	%Using ZMP
     
%      w1 = atan2(tar_zmp(1,1),L-tar_zmp(1,3)-L3-L0);
%      w2 = sqrt(tar_zmp(1,1)^2+tar_zmp(1,2)^2+(L-tar_zmp(1,3)-L3-L0)^2);
%      w3 = acos((w2-L12)/(2*L1));
        %w4 = atan(tar_zmp(1,2)/(L-tar_zmp(1,3)-L3-L0));

    %right leg
%      z1 = -1 * (w1+w3) * 180 / 3.14;    %knee pitch
%      z2 = -1 * (w1-w3) * 180 / 3.14;    %foot pitch
        %z3 = w4 * 180 / 3.14;              %hip roll
        %z4 = w4 * 180 / 3.14;              %foot roll
        %z5 = 0;                            %hip yaw
    
    %left leg
%      w5 = atan2(tar_zmp(2,1),L-tar_zmp(2,3)-L3-L0);
%      w6 = sqrt(tar_zmp(2,1)^2+tar_zmp(2,2)^2+(L-tar_zmp(2,3)-L3-L0)^2);
%      w7 = acos((w6-L12)/(2*L1));
    %w8 = atan(tar_zmp(2,2)/(L-tar_zmp(2,3)-L3-L0));
    
%      z6 = (w5+w7) * 180 / 3.14;         %knee pitch
%      z7 = (w5-w7) * 180 / 3.14;         %foot pitch
    %z8 = w8 * 180 / 3.14;              %hip roll
    %z9 = w8 * 180 / 3.14;              %foot roll
    %z10 = 0;                           %hip yaw
    
%     zmp_angle = [z1 z2 z6 z7];
    %zmp_angle = [z1 z2 z3 z4 z5  z6 z7 z8 z9 z10];
end
