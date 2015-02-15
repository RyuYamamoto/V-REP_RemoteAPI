function Init_PreviewControl_Paramter()
    pc_time=1;          %�\����
    calc_time=8;        %���s�p�^�[���̐�������
    sample_time=0.01;   %�T���v�����O�^�C��
    center_z=0.27;      %�d�S�ʒu(z��)(Accelite��0.27m)
    g=-9.81;            %�d�͉����x

    %�V�X�e���̌W���s��
    A=[0 1 0;0 0 1;0 0 0];
    B=[0;0;1];
    C=[1 0 center_z/g];
    D=0;
    E_d=[sample_time;1;0];              %�O���s��
    sys=ss(A,B,C,D);                    %��ԋ�ԃ��f���̍쐬
    sys_d=c2d(sys,sample_time);         %sample_time�ŗ��U��
    [A_d,B_d,C_d,D_d]=ssdata(sys_d);    %��ԋ�ԃ��f���ɃA�N�Z�X(�W���s��̎擾)

    %�G���[�V�X�e���̌W���s��
    ZERO=[0;0;0];
    phi=[1 -C_d*A_d;ZERO A_d];
    G=[-C_d*B_d;B_d];
    GR=[1;ZERO];
    G_d=[-C_d*E_d;E_d];

    Q=zeros(4,4);   %��s��
    Q(1)=1e+8;      %�d�݌W��(ZMP�����z�n�ɋ߂Â��̂�1e+8)
    H=1;            %�d�݌W��

    %���J�b�`�������̈�����ƃQ�C��K�����߂�
    [K,P]=dlqr(phi,G,Q,H);
    K=-(H+G'*P*G)^(-1)*G'*P*phi;

    xi = (eye(4,4)-G*(H+G'*P*G)^(-1)*G'*P)*phi;
    
    %�����l
    x = [0; 0; 0];  %�d�Sx
    y = [0; 0; 0];  %�d�Sy
    xp = x;
    yp = x;
    save('data/PreviewControl_Table');
end