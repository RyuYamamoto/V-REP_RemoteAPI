function Set_Ready()
    load('data/ServoID');
    
    ReadyPos = [0 0 20 ; 0 0 20];
    AngPos = Cal_Inv_Kine(ReadyPos);
    Servo_OutPut(AngPos,0.05);
    
    pause(1);
end
