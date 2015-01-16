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
        
%         RSMove(KneeR_P,zmp_angle(1));    %EGsb`
%         RSMove(AnkleR_P,zmp_angle(2));   %E«ñsb`
        RSMove(HipR_R,cog_angle1)      %EÒ[
        RSMove(AnkleR_R,cog_angle2);   %E«ñ[
        %RSMove(HipR_Y,angle5);          %EÒ[
        
%         RSMove(KneeL_P,zmp_angle(1));    %¶Gsb`
%         RSMove(AnkleL_P,zmp_angle(2));   %¶«ñsb`
        RSMove(HipL_R,cog_angle1);     %¶Ò[
        RSMove(AnkleL_R,cog_angle2);   %¶«ñ[
        %RSMove(HipL_Y,angle10);         %¶Ò[

        vrep.simxPauseCommunication(clientID,0);
    
        i=i+1;
        pause(period);     %êèüúwait
    end
end
