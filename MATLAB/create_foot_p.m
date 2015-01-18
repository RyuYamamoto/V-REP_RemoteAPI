%|-----------------------------|
%|-@file    create_foot_p.m    |
%|-@brief   Create Foot Point  |
%|-@date    2015.1.23          |
%|-@author  Ryu Yamamoto       |
%|-----------------------------|
function [Preview_Foot_x , Preview_Foot_y ,Preview_Foot_z_right , Preview_Foot_z_left] = create_foot_p(foot_point)
    load('data/PreviewControl_Table');
    load('data/walk_parameter_table');
    
    i = 1;
    n = 1;
    
    for t = 0:sample_time:calc_time+pc_time+1
        if(t == foot_point(n,1))
            Preview_Foot_x(i) = foot_point(n,2);
            Preview_Foot_y(i) = foot_point(n,3);
            Preview_Foot_z_right(i) = foot_point(n,4);
            Preview_Foot_z_left(i) = foot_point(n,5);
            n = n + 1;
        else
            Preview_Foot_x(i) = Preview_Foot_x(i-1);
            Preview_Foot_y(i) = Preview_Foot_y(i-1);
            Preview_Foot_z_right(i) = Preview_Foot_z_right(i-1);
            Preview_Foot_z_left(i) = Preview_Foot_z_left(i-1);
        end
        i = i + 1;
    end
end
