close all, clc;
clear all
disp('Preview Controll');

%↓歩幅・時間
%Foot = [0 0 0; 3 0.2 0.06; 3.5 0.4 -0.06; 4 0.6 0.06; 4.5 0.8 -0.06; 5 1 0.06;5.5 1.2 -0.06;6 1.4 0.06;6.5 1.6 -0.06;7 1.8 0.06;100 0 0];%ステップごとの足の位置
Foot = [0 0 0; 3 0 0.044; 3.5 0 -0.044; 4 0 0.044; 4.5 0 -0.044; 5 0 0.044; 5.5 0 -0.044; 6 0 0.044;6.5 0 -0.044;7 0 0.044;7.5 0 -0.044 ;8 0 0; 100 0 0];%ZMP値一定(0m)
%Foot = [0 0 0; 3 0.2 0.06; 3.5 0.4 -0.06; 4 0.6 0.06; 4.5 0.8 -0.06; 5 1 0.06;5.5 1.2 -0.06;6 1.4 0.06;6.5 1.6 -0.06;100 0 0];
%dx = [0 0 ; 3 0; 3.5 0 ; 4 0 ; 4.5 1 ; 5 1 ;5.5 0 ;100 0 ];%ステップ毎の外力
%dy = [0 0 ; 3 0; 3.5 0 ; 4 0 ; 4.5 1 ; 5 1 ;5.5 0 ;100 0 ];

pc_time=1;%予見幅
calc_time=10;%歩行パターンの生成時間
sample_time=0.01;%サンプリングタイム
center_z=0.27;%重心位置(z軸)(Acceliteは0.27m)
g=-9.81;%重力加速度

%システムの係数行列
A=[0 1 0;0 0 1;0 0 0];
B=[0;0;1];
C=[1 0 center_z/g];
D=0;
E_d=[sample_time;1;0];%外乱行列
sys=ss(A,B,C,D);%状態空間モデルの作成
sys_d=c2d(sys,sample_time);%sample_timeで離散化
[A_d,B_d,C_d,D_d]=ssdata(sys_d);%状態空間モデルにアクセス(係数行列の取得)

%エラーシステムの係数行列
ZERO=[0;0;0];
phi=[1 -C_d*A_d;ZERO A_d];
G=[-C_d*B_d;B_d];
GR=[1;ZERO];
G_d=[-C_d*E_d;E_d];

Q=zeros(4,4);%零行列
Q(1)=1e+8;%重み係数(ZMPが理想系に近づくのは1e+8)
H=1;%重み係数

%リカッチ方程式の安定解とゲインKを求める
%sys_lqr=ss(phi,G,Q,H);
[K,P]=dlqr(phi,G,Q,H);
K=-(H+G'*P*G)^(-1)*G'*P*phi;

%初期値
x = [0; 0; 0];
y = [0; 0; 0];
xp = x;
yp = x;

t = 0:sample_time:calc_time;%0から歩行パターン生成時間までサンプリングタイム0.01sで刻む

%↓インクリメント用に最初に1を代入
i = 1;										
n = 1;

for tt = 0:sample_time:calc_time+pc_time+1
	if (tt == Foot(n,1))%進ませた時間が目標ZMP値を設定した時間が一致したとき
		prefx(i) = Foot(n,2);%目標ZMP(x)
		prefy(i) = Foot(n,3);%目標ZMP(y)
		n = n + 1;%1ステップ進む
    else%時間が一致しない場合はそのまま
		prefx(i) = prefx(i-1);
		prefy(i) = prefy(i-1);
	end
	i = i + 1;
end

i = 0;
ux = 0;
uy = 0;

xi = (eye(4,4)-G*(H+G'*P*G)^(-1)*G'*P)*phi;

%dux,duyは計算によって得られる制御入力
%ux,uyは計算による制御入力
for tt = t
	i = i + 1;
	px = C_d*x;%出力ZMP(x方向)
	py = C_d*y;%出力ZMP(y方向)
	ex = prefx(i) - px;%目標ZMPとの誤差(x方向)
	ey = prefy(i) - py;%目標ZMPとの誤差(y方向)
	X = [ex; x - xp];%xpは前回の重心位置(x方向)
	Y = [ey; y - yp];%ypは前回の重心位置(y方向)
	xp = x;
	yp = y;
	dux = K * X;
	j = 0;
    
	for ttt = tt : sample_time : (tt + pc_time) ;
		j = j + 1;
		if (prefx(i+j) - prefx(i+j-1)) ~= 0%目標ZMPの誤差が0でない
			f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;
            fd = -(H+G'*P*G)^(-1)*(xi')^j*P*G_d;
			dux = dux + f * (prefx(i+j) - prefx(i+j-1));
		end
	end
	ux = ux + dux;
                                                                                                                                                
	duy = K * Y;
	j = 0;
	for ttt = tt : sample_time : (tt + pc_time)
		j = j + 1;
		if (prefy(i+j) - prefy(i+j-1)) ~= 0
			f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;
            fd = -(H+G'*P*G)^(-1)*G'*(xi')^j*P*G_d;
			duy = duy + f * (prefy(i+j) - prefy(i+j-1));
		end
	end
	uy = uy + duy;

    %↓外乱条件分岐
    if(5<=ttt&&ttt<=5.12)
        dx=0;
        dy=0;
        x = A_d * x + B_d * ux + E_d * dx * sample_time;
        y = A_d * y + B_d * uy + E_d * dy * sample_time;
    else
        dx=0;
        dy=0;
        x = A_d * x + B_d * ux + E_d * dx * sample_time;
        y = A_d * y + B_d * uy + E_d * dy * sample_time;
    end
	x0(i) = x(1);
    y0(i) = y(1);
	x1(i) = prefx(i);
	y1(i) = prefy(i);
	x2(i) = px;
	y2(i) = py;
end

subplot(2,1,1);
plot( t,x0,t,x1,'r',t, x2,'--',t,y0,t,y0,'b', t,y1,'r',t, y2,'g--');
grid();
subplot(2,1,2);
plot( x0,y0,x1,y1,'r');
grid();
%subplot(4,1,3);
%plot(x0,y0);
%subplot(4,1,4);
%plot(x1,y1);
disp('Program Ended');