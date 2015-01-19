<<<<<<< HEAD
function Init_PreviewControl_Paramter()
    pc_time=1;          %予見幅
    calc_time=10;        %歩行パターンの生成時間
    sample_time=0.01;   %サンプリングタイム
    center_z=270;      %重心位置(z軸)(Acceliteは0.27m)
    g=-9810;            %重力加速度

    %システムの係数行列
=======
%|----------------------------------------------------|
%|-@file    Init_PreviewControl_Parameter.m           |
%|-@brief   Initializing Paramter of Preview Control  |
%|-@date    2015.1.23                                 |
%|-@author  Ryu Yamamoto                              |
%|----------------------------------------------------|
function Init_PreviewControl_Paramter()
    pc_time=1;          %Preview Width
    calc_time=10;       %Time for Walk Pattern
    sample_time=0.01;   %Sampling Time
    center_z=290;       %Position of Center Of Gravity(z)
    g=-9810;            %Acceleration Of Gravity

    %Coefficient Matrix of System
>>>>>>> PreviewControl
    A=[0 1 0;0 0 1;0 0 0];
    B=[0;0;1];
    C=[1 0 center_z/g];
    D=0;
<<<<<<< HEAD
    E_d=[sample_time;1;0];              %外乱行列
    sys=ss(A,B,C,D);                    %状態空間モデルの作成
    sys_d=c2d(sys,sample_time);         %sample_timeで離散化
    [A_d,B_d,C_d,D_d]=ssdata(sys_d);    %状態空間モデルにアクセス(係数行列の取得)

    %エラーシステムの係数行列
=======
    E_d=[sample_time;1;0];              %Disturbance Matrix
    sys=ss(A,B,C,D);                    %State Space Model
    sys_d=c2d(sys,sample_time);         %Discretization
    [A_d,B_d,C_d,D_d]=ssdata(sys_d);

    %Error System
>>>>>>> PreviewControl
    ZERO=[0;0;0];
    phi=[1 -C_d*A_d;ZERO A_d];
    G=[-C_d*B_d;B_d];
    GR=[1;ZERO];
<<<<<<< HEAD
    G_d=[-C_d*E_d;E_d];                 %外乱予見制御に使用(歩行パターン生成には使用しない)

    Q=zeros(4,4);   %零行列
    Q(1)=1e+8;      %重み係数(ZMPが理想系に近づくのは1e+8)
    H=1;            %重み係数

    %リカッチ方程式の安定解とゲインKを求める
=======
    G_d=[-C_d*E_d;E_d];

    Q=zeros(4,4);   
    Q(1)=1e+8;     
    H=1;   
    
    %Riccati Equation
>>>>>>> PreviewControl
    [K,P]=dlqr(phi,G,Q,H);
    K=-(H+G'*P*G)^(-1)*G'*P*phi;

    xi = (eye(4,4)-G*(H+G'*P*G)^(-1)*G'*P)*phi;
    
<<<<<<< HEAD
    %初期値
%     x = [0; 0; 0];  %重心x
%     y = [0; 0; 0];  %重心y
%     xp = x;
%     yp = y;
=======
>>>>>>> PreviewControl
    save('data/PreviewControl_Table');
end