function [cog_x,cog_y,output_zmp_x,output_zmp_y] = calc_preview_control(foot_p_x,foot_p_y)
    load('data/PreviewControl_Table');
    load('data/walk_paramter_table');
    
    x = [0;0;0];
    y = [0;0;0];
    xp = x;
    yp = y;
    
    t = 0:sample_time:calc_time; %0sからｈ高パターン生成時間まで指定のサンプリングタイムで刻む
    
    %ループ計算
    count = 0;
    ux = 0;
    uy = 0;
    for tt = t
        count = count + 1;
        px = C_d * x;           %出力ZMP(x方向)
        py = C_d * y;           %出力ZMP(y方向)
        ex = foot_p_x(count) - px;  %目標ZMPとの誤差(x方向)
        ey = foot_p_y(count) - py;  %目標ZMPとの誤差(y方向)
        X = [ex ; x - xp];      %ひとつ前の重心位置
        Y = [ey ; y - yp];
        xp = x;
        yp = y;
        
        dux = K * X;    %状態フィードバック
        j = 0;
        for ttt = tt : sample_time : (tt + pc_time) ;
            j = j + 1;
            if (foot_p_x(count+j) - foot_p_x(count+j-1)) ~= 0
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;          %ZMPフィードフォワード項(今回のはロボット座標における足先目標位置)
                fd = -(H+G'*P*G)^(-1)*(xi')^j*P*G_d;               %外乱フィードフォワード項
                dux = dux + f * (foot_p_x(count+j) - foot_p_x(count+j-1));  
            end
        end
        ux = ux + dux;      %制御入力
        
        duy = K * Y;    %状態フィードバック
        j = 0;
        for ttt = tt : sample_time : (tt + pc_time)
            j = j + 1;
            if (foot_p_y(count+j) - foot_p_y(count+j-1)) ~= 0
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;          %ZMPフィードフォワード項(今回のはロボット座標における足先目標位置)
                fd = -(H+G'*P*G)^(-1)*G'*(xi')^j*P*G_d;            %外乱フィードフォワード項
                duy = duy + f * (foot_p_y(count+j) - foot_p_y(count+j-1));
            end
        end
        uy = uy + duy;      %制御入力
        
        dx=0;
        dy=0;
        x = A_d * x + B_d * ux+E_d * dx * sample_time;     %重心軌道(x方向)
        y = A_d * y + B_d * uy+E_d * dy * sample_time;     %重心軌道(y方向)
        
        cog_x(count) = x(1);       %重心軌道
        cog_y(count) = y(1));
        output_zmp_x(count) = px;  %出力ZMP
        output_zmp_y(count) = py;
    end
end
