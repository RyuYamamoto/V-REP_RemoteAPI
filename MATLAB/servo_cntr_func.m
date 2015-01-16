%Control Servo Motor
function servo_cntr_func(cog_x,cog_y,output_zmp_x,output_zmp_y)
    load('data/ServoID.mat');
    load('data/walk_parameter_table');
    
    i=1;
    while(1)
        %Calculation Invert Kinematics
        [cog_angle,zmp_angle] = Cal_Inv_Kine(cog_x(i),cog_y(i),output_zmp_x(i),output_zmp_y(i));
        
        %Servo Control Start
        vrep.simxPauseCommunication(clientID,1);
        
        RSMove(KneeR_P,zmp_angle(1));    %右膝ピッチ
        RSMove(AnkleR_P,zmp_angle(2));   %右足首ピッチ
        RSMove(HipR_R,cog_angle(1))      %右股ロール
        RSMove(AnkleR_R,cog_angle(2));   %右足首ロール
        %RSMove(HipR_Y,angle5);          %右股ヨー
        
        RSMove(KneeL_P,zmp_angle(1));    %左膝ピッチ
        RSMove(AnkleL_P,zmp_angle(2));   %左足首ピッチ
        RSMove(HipL_R,cog_angle(1));     %左股ロール
        RSMove(AnkleL_R,cog_angle(2));   %左足首ロール
        %RSMove(HipL_Y,angle10);         %左股ヨー

        vrep.simxPauseCommunication(clientID,0);
    
        i=i+1;
        wait(period);     %一定周期wait
    end
end