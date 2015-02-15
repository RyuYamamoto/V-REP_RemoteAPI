%|------------------------------|
%|-@file    motion_seq.m        |
%|-@brief   Run Walking Motion  |
%|-@date    2015.1.23           |
%|-@author  Ryu Yamamoto        |
%|------------------------------|
function motion_seq(zmp_p)

    %Load Table for Prameter of Preview Control
    load('data/PreviewControl_Table');
    
    [pre_foot_x,pre_foot_y,pre_foot_z_right,pre_foot_z_left] = create_foot_p(zmp_p);                %Create Control Point
    [cog_x,cog_y,output_zmp_x,output_zmp_y] = calc_preview_control(pre_foot_x,pre_foot_y);          %Calculation Preview Control(Output COG trajectry and ZMP Pattern)
    servo_cntr_func(cog_x,cog_y,output_zmp_x,output_zmp_y,pre_foot_z_right,pre_foot_z_left);        %Servo Control
end
