%|-----------------------------------------|
%|-@file    calc_fwd_kine.m                |
%|-@brief   Calculation Foward Kinematics  |
%|-@date    2015.1.23                      |
%|-@author  Ryu Yamamoto                   |
%|-----------------------------------------|
function calc_fwd_kine()
    
    %Load Mat files
    load('data/ServoID.mat')
    load('data/walk_parameter_table.mat')
    
    %Link paramter
    L0  = 41;
    L1  = 105;
    L12 = 41;
    L2  = 105;
    L3  = 43.5;
    L   = L0 + L1 + L12 + L2 + L3;
    
    