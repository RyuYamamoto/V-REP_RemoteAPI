%|----------------------------------|
%|-@file    ServoID.m               |
%|-@brief   Initializing ServoID    |
%|-@date    2015.1.23               |
%|-@author  Ryu Yamamoto            |
%|----------------------------------|
function ServoID()
    Neck        = 23;
  
    ShoulderL   = 15;
    ElbowL      = 16;
    ShoulderR   = 19;
    ElbowR      = 20;

    HipL_Y      = 6;
    HipL_R      = 5;
    HipL_P      = 4;
    KneeL_P     = 3;
    AnkleL_P    = 2;
    AnkleL_R    = 1;

    HipR_Y      = 12;
    HipR_R      = 11;
    HipR_P      = 10;
    KneeR_P     = 9;
    AnkleR_P    = 8;
    AnkleR_R    = 7;

    clientID    = 0;

    Right       = 0;
    Left        = 1;
end