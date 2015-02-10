%|---------------------------------------------|
%|-@file    Init_Walk_Parameter.m              |
%|-@brief   Initializing Parameter of Walking  |
%|-@date    2015.1.23                          |
%|-@author  Ryu Yamamoto                       |
%|---------------------------------------------|
function Init_Walk_Parameter()
    period=0.01;            %Period of Walk Calculation
    lift_leg_time = 0.5;    %Time of Lifted Leg
    up_leg_length =45;     %Large of Lifted Leg
    max_zmp_y = 30;         %Max ZMP of y
    min_zmp_y = -30;        %Min ZMP of y
    offset = 20;            %Offset Angle
    offset_R = 5;
    offset_L = -5;
    ArmR = 10;              %Offset Angle of Right Arm
    ArmL = -10;             %Offset ANgle of Left Arm
    
    save('data/walk_parameter_table');
end
