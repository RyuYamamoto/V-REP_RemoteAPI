/****************************************
 * @file	test.cpp					*
 * @brief	Test Program for remote API	*
 * @author	Ryu Yamamoto				*
 * @date	2015/05/31					*
****************************************/

#include <iostream>

extern "C"{
	#include "extApi.h"
}

int main(int artc,char *argv[])
{
	int test_handle=0;
	int portNum=19999;
	int error_code;
	int clientID = simxStart((simxChar*)"127.0.0.1",19999,true,true,2000,5);

	if(clientID!=-1)
	{
		std::cout<<"connect sucess"<<std::endl;
		error_code = simxGetObjectHandle(clientID,"Neck_Joint",&test_handle,simx_opmode_oneshot_wait);
		std::cout<<"handle:"<<test_handle<<std::endl;
		extApi_sleepMs(1);
	}
	else
	{
		std::cout<<"cannot connect."<<std::endl;
	}
	simxFinish(clientID);
	return 0;
}
