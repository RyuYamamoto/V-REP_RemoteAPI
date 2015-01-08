function Set_Ready()
    load('data/ServoID');
    
<<<<<<< HEAD
    %下半身
=======
    %Set Ready Position
>>>>>>> aa4e37387606921f527262b2977053f2e9cd0a06
    ReadyPos = [0 0 20 ; 0 0 20];
    AngPos = Cal_Inv_Kine(ReadyPos);
    Servo_OutPut(AngPos,0.05);
    
    pause(1);
end
