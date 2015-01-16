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
        
        RSMove(KneeR_P,zmp_angle(1));    %�E�G�s�b�`
        RSMove(AnkleR_P,zmp_angle(2));   %�E����s�b�`
        RSMove(HipR_R,cog_angle(1))      %�E�҃��[��
        RSMove(AnkleR_R,cog_angle(2));   %�E���񃍁[��
        %RSMove(HipR_Y,angle5);          %�E�҃��[
        
        RSMove(KneeL_P,zmp_angle(1));    %���G�s�b�`
        RSMove(AnkleL_P,zmp_angle(2));   %������s�b�`
        RSMove(HipL_R,cog_angle(1));     %���҃��[��
        RSMove(AnkleL_R,cog_angle(2));   %�����񃍁[��
        %RSMove(HipL_Y,angle10);         %���҃��[

        vrep.simxPauseCommunication(clientID,0);
    
        i=i+1;
        wait(period);     %������wait
    end
end