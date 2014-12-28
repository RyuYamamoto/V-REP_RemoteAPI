%main m file
close all;clc;
clear all;
%ワークスペースにID設定
ServoID;
disp('Program started');
vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
pause(1);

load('data/Motion');
disp('Initialize Servo Motor...');
Servo_Init(480);
pause(2);
walk_cmd(STRAIGHT);

disp('Set Ready Mode...');
walk_cmd(READY);
pause(1);

% Set_Ready();
RSMove(ElbowR,10);
RSMove(ElbowL,-10);
pause(3);
i=0;
while(i~=5)
    straight_pos = [0 30 20 ; 0 30 20];
    straight_ang = Cal_Inv_Kine(straight_pos);
    Servo_OutPut(straight_ang,0.07);
    pause(1.5);

    straight_pos = [0 -30 20 ; 0 -30 20];
    straight_ang = Cal_Inv_Kine(straight_pos);
    Servo_OutPut(straight_ang,0.07);
    pause(1.5);
    
    i=i+1;
end
vrep.simxFinish(clientID); % close the line if still open
vrep.delete(); % call the destructor!