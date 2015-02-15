import vrep
import time

print 'Program Start.'
vrep.simxFinish(-1)
clientID=vrep.simxStart('127.0.0.1',19999,True,True,5000,5)

def robot_status_init(object_handle):
		res,position = vrep.simxGetObjectPosition(clientID,object_handle,-1,vrep.simx_opmode_streaimg)

def get_object_handle(object_name,all_switch):
		if all_switch == 1:
				res,objs = vrep.simxGetObjects(clientID,vrep.sim_handle_all,vrep.simx_opmode_oneshow_wait)
		else:
				res,objs = vrep.simxGetObjects(clientID,object_name,vrep.simx_opmode_oneshot_wait)

		return objs

def move_object(x,y,z,object_handle):
		res,position = vrep.simxGetObjectPosition(clientID,object_handle,-1,vrep.simx_opmode_buffer)
		
		position[0] += x;
		position[1] += y;
		position[2] += z;

		res = vrep.simxSetObjectPosition(clientID,object_handle,-1,position,vrep.simx_opmode_oneshot)

def main():
		x = 0.1
		y = 0.1
		z = 0
		
		object_num = get_object_handle('redundantRob_manipSphere',0)
		robot_status_init(object_num)
		move_object(x,y,z,object_num)

if __name__ == "__main__":
		main()

