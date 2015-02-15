%|-------------------------------------------------------------|
%|-@file    cal_inv_kine_cog.m                                 |
%|-@brief   Calculation Invert Kinematics for COG Trajectory   |
%|-@date    2015.1.23                                          |
%|-@author  Ryu Yamamoto                                       |
%|-------------------------------------------------------------|
function [cog_angle] = cal_inv_kine_cog(cog_x,cog_y)

    %Load Mat Files
    load('data/walk_parameter_table');
    
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

    cog_angle(1) = g1;
    cog_angle(2) = g2;
end
