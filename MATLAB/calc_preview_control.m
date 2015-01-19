<<<<<<< HEAD
function [cog_x,cog_y,output_zmp_x,output_zmp_y] = calc_preview_control(foot_p_x,foot_p_y)
    load('data/PreviewControl_Table');
    load('data/walk_paramter_table');
=======
%|---------------------------------------|
%|-@file    calc_preview_control.m       |
%|-@brief   Calculation Preview Control  |
%|-@date    2015.1.23                    |
%|-@author  Ryu Yamamoto                 |
%|---------------------------------------|
function [cog_x,cog_y,output_zmp_x,output_zmp_y] = calc_preview_control(foot_p_x,foot_p_y)
    load('data/PreviewControl_Table');
    load('data/walk_parameter_table');
>>>>>>> PreviewControl
    
    x = [0;0;0];
    y = [0;0;0];
    xp = x;
    yp = y;
    
<<<<<<< HEAD
    t = 0:sample_time:calc_time; %0s���炈���p�^�[���������Ԃ܂Ŏw��̃T���v�����O�^�C���ō���
    
    %���[�v�v�Z
    count = 0;
    ux = 0;
    uy = 0;
    for tt = t
        count = count + 1;
        px = C_d * x;           %�o��ZMP(x����)
        py = C_d * y;           %�o��ZMP(y����)
        ex = foot_p_x(count) - px;  %�ڕWZMP�Ƃ̌덷(x����)
        ey = foot_p_y(count) - py;  %�ڕWZMP�Ƃ̌덷(y����)
        X = [ex ; x - xp];      %�ЂƂO�̏d�S�ʒu
=======
    t = 0:sample_time:calc_time;
    
    %Initialized Increment Parameter
    count = 0;
    ux = 0;
    uy = 0;
    
    %Loop Start
    for tt = t
        count = count + 1;
        px = C_d * x;               %Output ZMP(x)
        py = C_d * y;               %Output ZMP(y)
        ex = foot_p_x(count) - px;  %Eroor between the target ZMP(x)
        ey = foot_p_y(count) - py;  %Eroor between the target ZMP(y)
        X = [ex ; x - xp];
>>>>>>> PreviewControl
        Y = [ey ; y - yp];
        xp = x;
        yp = y;
        
<<<<<<< HEAD
        dux = K * X;    %��ԃt�B�[�h�o�b�N
=======
        dux = K * X;    %State Feedback
>>>>>>> PreviewControl
        j = 0;
        for ttt = tt : sample_time : (tt + pc_time) ;
            j = j + 1;
            if (foot_p_x(count+j) - foot_p_x(count+j-1)) ~= 0
<<<<<<< HEAD
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;          %ZMP�t�B�[�h�t�H���[�h��(����̂̓��{�b�g���W�ɂ����鑫��ڕW�ʒu)
                fd = -(H+G'*P*G)^(-1)*(xi')^j*P*G_d;               %�O���t�B�[�h�t�H���[�h��
                dux = dux + f * (foot_p_x(count+j) - foot_p_x(count+j-1));  
            end
        end
        ux = ux + dux;      %�������
        
        duy = K * Y;    %��ԃt�B�[�h�o�b�N
=======
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;         %ZMP feedforward term
                fd = -(H+G'*P*G)^(-1)*(xi')^j*P*G_d;               %Disturbance feedforward term
                dux = dux + f * (foot_p_x(count+j) - foot_p_x(count+j-1));  
            end
        end
        ux = ux + dux;      %Control input
        
        duy = K * Y;    %State Feedback
>>>>>>> PreviewControl
        j = 0;
        for ttt = tt : sample_time : (tt + pc_time)
            j = j + 1;
            if (foot_p_y(count+j) - foot_p_y(count+j-1)) ~= 0
<<<<<<< HEAD
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;          %ZMP�t�B�[�h�t�H���[�h��(����̂̓��{�b�g���W�ɂ����鑫��ڕW�ʒu)
                fd = -(H+G'*P*G)^(-1)*G'*(xi')^j*P*G_d;            %�O���t�B�[�h�t�H���[�h��
                duy = duy + f * (foot_p_y(count+j) - foot_p_y(count+j-1));
            end
        end
        uy = uy + duy;      %�������
        
        dx=0;
        dy=0;
        x = A_d * x + B_d * ux+E_d * dx * sample_time;     %�d�S�O��(x����)
        y = A_d * y + B_d * uy+E_d * dy * sample_time;     %�d�S�O��(y����)
        
        cog_x(count) = x(1);       %�d�S�O��
        cog_y(count) = y(1);
        fprintf('%f\n',y(1));
        output_zmp_x(count) = px;  %�o��ZMP
=======
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;         %ZMP feedforward term
                fd = -(H+G'*P*G)^(-1)*G'*(xi')^j*P*G_d;            %Disturbance feedforward term
                duy = duy + f * (foot_p_y(count+j) - foot_p_y(count+j-1));
            end
        end
        uy = uy + duy;      %Control input
        
        dx=0;
        dy=0;
        x = A_d * x + B_d * ux+E_d * dx * sample_time;     %COG Trajectory(x)
        y = A_d * y + B_d * uy+E_d * dy * sample_time;     %COG Trajectory(y)
        
        cog_x(count) = x(1);       %COG Trajectory
        cog_y(count) = y(1);
        output_zmp_x(count) = px;  %Output ZMP
>>>>>>> PreviewControl
        output_zmp_y(count) = py;
    end
end