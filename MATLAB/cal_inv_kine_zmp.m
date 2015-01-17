%|--------------------------------------------------|
%|-@file    cal_int_kine_zmp.m                      |
%|-@brief   Calculation Invet Kinematics  using ZMP |
%|-@date    2015.1.23                               |
%|-@author  Ryu Yamamoto                            |
%|--------------------------------------------------|
function Target_Angle = cal_inv_kine_zmp(output_zmp_x,output_zmp_y)

    %Load Mat files
    load('data/ServoID');
    load('data/walk_paramter_table.mat');
    
    %Link paramter
    L0  = 41;
    L1  = 105;
    L12 = 41;
    L2  = 105;
    L3  = 43.5;
    L   = L0 + L1 + L12 + L2 + L3;
    
    %Calculation Invert Kinematics
    %right leg
    w1 = atan2(output_zmp_x,L-target_position(1,3)-L3-L0);
    w2 = sqrt(output_zmp_x^2+output_zmp_y^2+(L-target_position(1,3)-L3-L0)^2);
    w3 = acos((w2-L12)/(2*L1));
    
    d1 = -1 * (w1+w3) * 180 / 3.14;    %knee pitch
    d2 = -1 * (w1-w3) * 180 / 3.14;    %foot pitch
    
    %left leg
    w5 = atan2(output_zmp_x,L-target_position(2,3)-L3-L0);
    w6 = sqrt(output_zmp_x^2+output_zmp_y^2+(L-target_position(2,3)-L3-L0)^2);
    w7 = acos((w6-L12)/(2*L1));
    
    d6 = (w5+w7) * 180 / 3.14;         %knee pitch
    d7 = (w5-w7) * 180 / 3.14;         %foot pitch
    
    Target_Angle = [d1 d2 d6 d7];
end
