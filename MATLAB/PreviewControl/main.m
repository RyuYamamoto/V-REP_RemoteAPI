%|------------------------|
%|-@file    main.m        |
%|-@brief   Main Program  |
%|-@date    2015.1.23     |
%|-@author  Ryu Yamamoto  |
%|------------------------|

%-----------------------------------------------------------
%---------------------Simulator Setting---------------------
%-----------------------------------------------------------
close all;clc;
clear all;
disp('Program started');
vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
pause(1);
%-----------------------------------------------------------

%----------------------
%----Load Mat files----
%----------------------
load('data/ServoID');
load('data/Motion');
%----------------------

%---------------------------
%-Robot Status Initilaizing-
%---------------------------
Servo_Init(480);
pause(2);
robot_status_init();
pause(2);
walk_cmd(STRAIGHT);
walk_cmd(READY);
%---------------------------

%------------------------------
%----Walk Command Transimit----
%------------------------------
disp('Walk command transmit.');
walk_cmd(STEP);
%------------------------------

%----------------------------
%--------Program End.--------
%----------------------------
vrep.simxFinish(clientID);
vrep.delete();
%----------------------------
