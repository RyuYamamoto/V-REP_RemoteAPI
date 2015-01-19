<<<<<<< HEAD
function Init_PreviewControl_Paramter()
    pc_time=1;          %�\����
    calc_time=10;        %���s�p�^�[���̐�������
    sample_time=0.01;   %�T���v�����O�^�C��
    center_z=270;      %�d�S�ʒu(z��)(Accelite��0.27m)
    g=-9810;            %�d�͉����x

    %�V�X�e���̌W���s��
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
    E_d=[sample_time;1;0];              %�O���s��
    sys=ss(A,B,C,D);                    %��ԋ�ԃ��f���̍쐬
    sys_d=c2d(sys,sample_time);         %sample_time�ŗ��U��
    [A_d,B_d,C_d,D_d]=ssdata(sys_d);    %��ԋ�ԃ��f���ɃA�N�Z�X(�W���s��̎擾)

    %�G���[�V�X�e���̌W���s��
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
    G_d=[-C_d*E_d;E_d];                 %�O���\������Ɏg�p(���s�p�^�[�������ɂ͎g�p���Ȃ�)

    Q=zeros(4,4);   %��s��
    Q(1)=1e+8;      %�d�݌W��(ZMP�����z�n�ɋ߂Â��̂�1e+8)
    H=1;            %�d�݌W��

    %���J�b�`�������̈�����ƃQ�C��K�����߂�
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
    %�����l
%     x = [0; 0; 0];  %�d�Sx
%     y = [0; 0; 0];  %�d�Sy
%     xp = x;
%     yp = y;
=======
>>>>>>> PreviewControl
    save('data/PreviewControl_Table');
end