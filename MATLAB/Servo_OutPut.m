%Output Servo Motor function
%param    Target_Angle:Degree for Calculation of IK   Vel:Velocity of move joint
%return   No 
function Servo_OutPut(Target_Angle_lower,Target_Angle_upper,Vel)
    load('data/ServoID');
    
    owari = 0;
    
    %足の現在角度を取得(両足)
    Angle_Value_lower = Get_Angle_Leg();
    Angle_Value_upper = Get_Angle_Arm();
    
    %初期値として代入
    old_angle1 = Angle_Value_lower(1);
    old_angle2 = Angle_Value_lower(2);
    old_angle3 = Angle_Value_lower(3);
    old_angle4 = Angle_Value_lower(4);
    old_angle5 = Angle_Value_lower(5);
    old_angle6 = Angle_Value_lower(6);
    old_angle7 = Angle_Value_lower(7);
    old_angle8 = Angle_Value_lower(8);
    old_angle9 = Angle_Value_lower(9);
    old_angle10 = Angle_Value_lower(10);
    old_angle11 = Angle_Value_upper(1);
    old_angle12 = Angle_Value_upper(2);
    
    %ループ
    while(owari ~= 1)
        %現在角度と目標角度の差分を取得
        diff = Angle_Diff(Target_Angle_lower,Target_Angle_upper);
        
        %ステップ幅を取得(1,-1,0)
        step = Dec_Step(diff);
        
        %角度を１ステップ進める
        angle1 = old_angle1 + step(1);
        angle2 = old_angle2 + step(2);
        angle3 = old_angle3 + step(3);
        angle4 = old_angle4 + step(4);
        angle5 = old_angle5 + step(5);
        angle6 = old_angle6 + step(6);
        angle7 = old_angle7 + step(7);
        angle8 = old_angle8 + step(8);
        angle9 = old_angle9 + step(9);
        angle10 = old_angle10 + step(10);
        angle11 = old_angle11 + step(11);
        angle12 = old_angle12 + step(12);
        
        %ジョイントを駆動
        vrep.simxPauseCommunication(clientID,1);
        RSMove(KneeR_P,angle1);    %左膝ピッチ
        RSMove(AnkleR_P,angle2);   %左足首ピッチ
        RSMove(HipR_R,angle3)     %左股ロール
        RSMove(AnkleR_R,angle4);     %左足首ロール
        RSMove(HipR_Y,angle5);     %左股ヨー
        RSMove(KneeL_P,angle6);    %左膝ピッチ
        RSMove(AnkleL_P,angle7);   %左足首ピッチ
        RSMove(HipL_R,angle8);     %左股ロール
        RSMove(AnkleL_R,angle9);     %左足首ロール
        RSMove(HipL_Y,angle10);     %左股ヨー
        RSMove(ElbowR,angle11);
        RSMove(ElbowL,angle12);
        vrep.simxPauseCommunication(clientID,0);

        %Vel分だけウェイト
        pause(Vel);
        
        %角度を格納
        old_angle1 = angle1;
        old_angle2 = angle2;
        old_angle3 = angle3;
        old_angle4 = angle4;
        old_angle5 = angle5;
        old_angle6 = angle6;
        old_angle7 = angle7;
        old_angle8 = angle8;
        old_angle9 = angle9;
        old_angle10 = angle10;
        old_angle11 = angle11;
        old_angle12 = angle12;
        
        zero = 0;
        %終了条件の判定
        for i=1:1:12
            if(step(i) == 0)
                zero = zero + 1;
            end
        end
        
        if(zero == 12)
            owari = 1;
        end
    end
end

%現在角度と目標角度の差分を取り、目標角に到達してるかを判断
%引数
%戻り値
function diff = Angle_Diff(Target_Value_lower,Target_Value_upper)
    load('data/ServoID');
    
    Angle_Value_upper = Get_Angle_Leg();
    Angle_Value_lower = Get_Angle_Arm();
    
    %右足
    df1 = Target_Value_lower(1) - Angle_Value_upper(1);
    df2 = Target_Value_lower(2) - Angle_Value_upper(2);
    df3 = Target_Value_lower(3) - Angle_Value_upper(3);
    df4 = Target_Value_lower(4) - Angle_Value_upper(4);
    df5 = Target_Value_lower(5) - Angle_Value_upper(5);
    
    %左足
    df6 = Target_Value_lower(6) - Angle_Value_upper(6);
    df7 = Target_Value_lower(7) - Angle_Value_upper(7);
    df8 = Target_Value_lower(8) - Angle_Value_upper(8);
    df9 = Target_Value_lower(9) - Angle_Value_upper(9);
    df10 = Target_Value_lower(10) - Angle_Value_upper(10);
    
    df11 = Target_Value_upper(1) - Angle_Value_lower(1);
    df12 = Target_Value_upper(2) - Angle_Value_lower(2);
    
    diff = [df1 df2 df3 df4 df5 df6 df7 df8 df9 df10 df11 df12];
end

%現在角度と目標角の差分からstep幅を決める
%引数
%戻り値
function step = Dec_Step(diff)
    i=1;
    step = [0 0 0 0 0 0 0 0 0 0 0 0];
    while(i<=12)
        if(diff(i) < -1)
            step(i) = -1;
        elseif(diff(i) > 1)
            step(i) = 1;
        elseif(diff(i) <= 1 && -1 <= diff(i))
            step(i) = 0;
        end
        i = i + 1;
    end
end
