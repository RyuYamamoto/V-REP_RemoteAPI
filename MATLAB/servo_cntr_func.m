<<<<<<< HEAD
%Control Servo Motor
function servo_cntr_func(cog_x,cog_y,output_zmp_x,output_zmp_y)
    load('data/ServoID.mat');
    load('data/walk_paramter_table');
    load('data/PreviewControl_Table.mat');
    
    i=1;
    while(i<=801)
        %Calculation Invert Kinematics
        [cog_angle1,cog_angle2] = cal_inv_kine_pc(cog_x(i),cog_y(i),output_zmp_x(i),output_zmp_y(i));
%         fprintf('%f\n',cog_y(i));
        %Servo Control Start
        fprintf('%f\n',cog_angle1);
        vrep.simxPauseCommunication(clientID,1);
        
%         RSMove(KneeR_P,zmp_angle(1));    %右膝ピッチ
%         RSMove(AnkleR_P,zmp_angle(2));   %右足首ピッチ
        RSMove(HipR_R,cog_angle1)      %右股ロール
        RSMove(AnkleR_R,cog_angle2);   %右足首ロール
        %RSMove(HipR_Y,angle5);          %右股ヨー
        
%         RSMove(KneeL_P,zmp_angle(1));    %左膝ピッチ
%         RSMove(AnkleL_P,zmp_angle(2));   %左足首ピッチ
        RSMove(HipL_R,cog_angle1);     %左股ロール
        RSMove(AnkleL_R,cog_angle2);   %左足首ロール
        %RSMove(HipL_Y,angle10);         %左股ヨー

        vrep.simxPauseCommunication(clientID,0);
    
        i=i+1;
        pause(period);     %一定周期wait
    end
end
=======
%|----------------------------------|
%|-@file    servo_cntr_func.m       |
%|-@brief   Servo Control function  |
%|-@date    2015.1.23               |
%|-@author  Ryu Yamamoto            |
%|----------------------------------|
function servo_cntr_func(cog_x,cog_y,output_zmp_x,output_zmp_y,pre_foot_z_right,pre_foot_z_left)

    %Load Mat Files
    load('data/ServoID.mat');
    load('data/walk_parameter_table');
    load('data/PreviewControl_Table.mat');
    
    i=1;
    while(i<=801)
        %Calculation Invert Kinematics
        [cog_angle] = cal_inv_kine_cog(cog_x(i),cog_y(i));
        [zmp_angle] = cal_inv_kine_zmp(output_zmp_x(i),output_zmp_y(i),pre_foot_z_right(i),pre_foot_z_left(i));
        fprintf('%f\n',zmp_angle(1));
        %Servo Control Start
        vrep.simxPauseCommunication(clientID,1);
        
        RSMove(KneeR_P,zmp_angle(1));   %right hip pitch
        RSMove(AnkleR_P,zmp_angle(2)); %right foot pitch
        RSMove(HipR_R,cog_angle(1));     %right hip roll
        RSMove(AnkleR_R,cog_angle(2));   %right foot roll
        
        RSMove(KneeL_P,zmp_angle(3));   %left hip pitch
        RSMove(AnkleL_P,zmp_angle(4)); %left foot pitch
        RSMove(HipL_R,cog_angle(1));     %left hip roll
        RSMove(AnkleL_R,cog_angle(2));   %left foot roll

        vrep.simxPauseCommunication(clientID,0);
    
        i=i+1;
        pause(period);     %wait
    end
end
>>>>>>> PreviewControl
