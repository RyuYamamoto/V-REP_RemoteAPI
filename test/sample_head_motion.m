close all;clc;
clear all
disp('Sample Program');
vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
pause(1);

try
	if(clietID>-1)
		disp('Connected to remote API server');
		
		%Set Angle Value(degree to radian)
		angle_pan = 45 * 3.14 / 180;
		angle_tilt = 45 * 3.14 / 180;
		
		%joint of handle('' is please according to the name of your robot joint)
		[res1,pan]=vrep.simxGetObjectHandle(clientID,'pan joint name',vrep.simx_opmode_oneshot_wait);
        	[res2,tilt]=vrep.simxGetObjectHandle(clientID,'tilt joint name',vrep.simx_opmode_oneshot_wait);

		%Move Joint(angle_pan and angle_tilt are angle to move the joint)
		vrep.simxPauseCommunication(clientID,1);
		[err1]=vrep.simxSetJointTargetPosition(clientID,pan,angle_pan,vrep.simx_opmode_oneshot);
        	[err2]=vrep.simxSetJointTargetPosition(clientID,tilt,angle_tilt,vrep.simx_opmode_oneshot);
		vrep.simxPauseCommunication(clientID,0);
		pause(1);

		disp('End.');
	else
		disp('Failed connecting to remote API server');
	end 
	vrep.delete();
catch err
	vrep.simxFinish(clientID);
	vrep.delete();
end;
disp('Program ended');
