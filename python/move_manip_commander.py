import vrep
import time
import sys

print 'Program Start.'
vrep.simxFinish(-1)
clientID=vrep.simxStart('127.0.0.1',19999,True,True,5000,5)
time.sleep(1.0)

if clientID == -1:
	print "Program End."
	sys.exit()

def robot_status_init(object_handle):
	res,position = vrep.simxGetObjectPosition(clientID,object_handle,-1,vrep.simx_opmode_streaming)
		
def get_object_handle(object_name,all_switch):
	#if all_switch == 1:
	#		res,objs = vrep.simxGetObjects(clientID,vrep.sim_handle_all,vrep.simx_opmode_oneshow_wait)
	#else:
	res,objs = vrep.simxGetObjectHandle(clientID,object_name,vrep.simx_opmode_oneshot_wait)

	return objs

def move_hand(x,y,z,object_handle):
	res,position = vrep.simxGetObjectPosition(clientID,object_handle,-1,vrep.simx_opmode_buffer)
	print object_handle,position

	x_pos = position[0]
	y_pos = position[1]
	z_pos = position[2]

	x_pos += x
	y_pos += y
	z_pos += z

	move_pos = [x_pos,y_pos,z_pos]

	print move_pos
	res = vrep.simxSetObjectPosition(clientID,object_handle,-1,move_pos,vrep.simx_opmode_oneshot)
	time.sleep(1.0)

def main():
	x = 0.02
	y = 0.02
	z = 0
		
	object_num = get_object_handle('redundantRob_manipSphere',0)
	robot_status_init(object_num)
	move_hand(x,y,z,object_num)

if __name__ == "__main__":
	main()

