function step_seq()
    load('data/PreviewControl_Table');
    
    zmp_p = [0 0 0;0.5 0 44;0.1 0 -44;0.15 0 44;0.2 0 -44;];
    [pre_foot_x,pre_foot_y] = create_foot_p(zmp_p);    %目標ZMP出力
    [cog_x,cog_y,output_zmp_x,output_zmp_y] = calc_preview_control(pre_foot_x,pre_foot_y);     %予見制御により重心軌道とZMP出力軌道を得る
    [output_zmp_local] = transform(output_zmp_x,output_zmp_y);   %ワールド座標からローカル座標へ変換
    [angle_value] = Calc_Inv_Kine(output_zmp_local);    %ローカル座標に変換した出力ZMPより逆運動学を計算する
    Servo_OutPut(angle_value,wait);     %サーボ出力
end