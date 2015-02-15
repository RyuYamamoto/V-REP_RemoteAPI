close all, clc;
clear all
disp('Preview Controll');

%�������E����
%Foot = [0 0 0; 3 0.2 0.06; 3.5 0.4 -0.06; 4 0.6 0.06; 4.5 0.8 -0.06; 5 1 0.06;5.5 1.2 -0.06;6 1.4 0.06;6.5 1.6 -0.06;7 1.8 0.06;100 0 0];%�X�e�b�v���Ƃ̑��̈ʒu
Foot = [0 0 0; 3 0 0.044; 3.5 0 -0.044; 4 0 0.044; 4.5 0 -0.044; 5 0 0.044; 5.5 0 -0.044; 6 0 0.044;6.5 0 -0.044;7 0 0.044;7.5 0 -0.044 ;8 0 0; 100 0 0];%ZMP�l���(0m)
%Foot = [0 0 0; 3 0.2 0.06; 3.5 0.4 -0.06; 4 0.6 0.06; 4.5 0.8 -0.06; 5 1 0.06;5.5 1.2 -0.06;6 1.4 0.06;6.5 1.6 -0.06;100 0 0];
%dx = [0 0 ; 3 0; 3.5 0 ; 4 0 ; 4.5 1 ; 5 1 ;5.5 0 ;100 0 ];%�X�e�b�v���̊O��
%dy = [0 0 ; 3 0; 3.5 0 ; 4 0 ; 4.5 1 ; 5 1 ;5.5 0 ;100 0 ];

pc_time=1;%�\����
calc_time=10;%���s�p�^�[���̐�������
sample_time=0.01;%�T���v�����O�^�C��
center_z=0.27;%�d�S�ʒu(z��)(Accelite��0.27m)
g=-9.81;%�d�͉����x

%�V�X�e���̌W���s��
A=[0 1 0;0 0 1;0 0 0];
B=[0;0;1];
C=[1 0 center_z/g];
D=0;
E_d=[sample_time;1;0];%�O���s��
sys=ss(A,B,C,D);%��ԋ�ԃ��f���̍쐬
sys_d=c2d(sys,sample_time);%sample_time�ŗ��U��
[A_d,B_d,C_d,D_d]=ssdata(sys_d);%��ԋ�ԃ��f���ɃA�N�Z�X(�W���s��̎擾)

%�G���[�V�X�e���̌W���s��
ZERO=[0;0;0];
phi=[1 -C_d*A_d;ZERO A_d];
G=[-C_d*B_d;B_d];
GR=[1;ZERO];
G_d=[-C_d*E_d;E_d];

Q=zeros(4,4);%��s��
Q(1)=1e+8;%�d�݌W��(ZMP�����z�n�ɋ߂Â��̂�1e+8)
H=1;%�d�݌W��

%���J�b�`�������̈�����ƃQ�C��K�����߂�
%sys_lqr=ss(phi,G,Q,H);
[K,P]=dlqr(phi,G,Q,H);
K=-(H+G'*P*G)^(-1)*G'*P*phi;

%�����l
x = [0; 0; 0];
y = [0; 0; 0];
xp = x;
yp = x;

t = 0:sample_time:calc_time;%0������s�p�^�[���������Ԃ܂ŃT���v�����O�^�C��0.01s�ō���

%���C���N�������g�p�ɍŏ���1����
i = 1;										
n = 1;

for tt = 0:sample_time:calc_time+pc_time+1
	if (tt == Foot(n,1))%�i�܂������Ԃ��ڕWZMP�l��ݒ肵�����Ԃ���v�����Ƃ�
		prefx(i) = Foot(n,2);%�ڕWZMP(x)
		prefy(i) = Foot(n,3);%�ڕWZMP(y)
		n = n + 1;%1�X�e�b�v�i��
    else%���Ԃ���v���Ȃ��ꍇ�͂��̂܂�
		prefx(i) = prefx(i-1);
		prefy(i) = prefy(i-1);
	end
	i = i + 1;
end

i = 0;
ux = 0;
uy = 0;

xi = (eye(4,4)-G*(H+G'*P*G)^(-1)*G'*P)*phi;

%dux,duy�͌v�Z�ɂ���ē����鐧�����
%ux,uy�͌v�Z�ɂ�鐧�����
for tt = t
	i = i + 1;
	px = C_d*x;%�o��ZMP(x����)
	py = C_d*y;%�o��ZMP(y����)
	ex = prefx(i) - px;%�ڕWZMP�Ƃ̌덷(x����)
	ey = prefy(i) - py;%�ڕWZMP�Ƃ̌덷(y����)
	X = [ex; x - xp];%xp�͑O��̏d�S�ʒu(x����)
	Y = [ey; y - yp];%yp�͑O��̏d�S�ʒu(y����)
	xp = x;
	yp = y;
	dux = K * X;
	j = 0;
    
	for ttt = tt : sample_time : (tt + pc_time) ;
		j = j + 1;
		if (prefx(i+j) - prefx(i+j-1)) ~= 0%�ڕWZMP�̌덷��0�łȂ�
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

    %���O����������
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