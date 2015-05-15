function motion_seq(zmp_p)
    load('data/PreviewControl_Table');		%Load Table for Prameter of Preview Control
     
    [pre_foot_x,pre_foot_y] = create_foot_p(zmp_p);                                                 %Create Control Point
    [cog_x,cog_y,output_zmp_x,output_zmp_y] = calc_preview_control(pre_foot_x,pre_foot_y);          %Calculation Preview Control(Output COG trajectry)
    [zmp_x_local,zmp_y_local] = transform(output_zmp_x,output_zmp_y);                               %Coordinate Transform(local from world)
    cog_trajectory = [cog_x cog_y];
    output_zmp = [zmp_x_local zmp_y_local];
    [cog_angle,zmp_angle] = Calc_Inv_Kine(cog_trajectory,output_zmp);                               %Calculation Invert Kinematics
    Servo_OutPut(cog_angle,zmp_angle,sampling_time);                                                %Servo Control
end
