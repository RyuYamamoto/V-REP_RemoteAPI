close all;clc;
clear all;

ServoID;
disp('Program started');
vrep=remApiSetup();
simxFinish(-1);
clientID=simxStart('127.0.0.1',19999,true,true,5000,5);
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

vrep.simxFinish(clientID); % close the line if still open
vrep.delete(); % call the destructor!