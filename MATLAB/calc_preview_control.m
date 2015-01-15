function [cog_x,cog_y,output_zmp_x,output_zmp_y] = calc_preview_control(foot_p_x,foot_p_y)
    load('data/PreviewControl_Table');
    
    x = [0;0;0];
    y = [0;0;0];
    xp = x;
    yp = y;
    
    t = 0:sample_time:calc_time; %0s���炈���p�^�[���������Ԃ܂Ŏw��̃T���v�����O�^�C���ō���
    
    %���[�v�v�Z
    for tt = t
        i = i + 1;
        px = C_d * x;           %�o��ZMP(x����)
        py = C_d * y;           %�o��ZMP(y����)
        ex = foot_p_x(i) - px;  %�ڕWZMP�Ƃ̌덷(x����)
        ey = foot_p_y(i) - py;  %�ڕWZMP�Ƃ̌덷(y����)
        X = [ex ; x - xp];      %�ЂƂO�̏d�S�ʒu
        Y = [ey ; y - yp];
        
        dux = K * X;    %��ԃt�B�[�h�o�b�N
        j = 0;
        for ttt = tt : sample_time : (tt + pc_time) ;
            j = j + 1;
            if (foot_p_x(i+j) - foot_p_x(i+j-1)) ~= 0
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;          %ZMP�t�B�[�h�t�H���[�h��(����̂̓��{�b�g���W�ɂ����鑫��ڕW�ʒu)
                %fd = -(H+G'*P*G)^(-1)*(xi')^j*P*G_d;                %�O���t�B�[�h�t�H���[�h��
                dux = dux + f * (foot_p_x(i+j) - foot_p_x(i+j-1));  
            end
        end
        ux = ux + dux;      %�������
        
        duy = K * Y;    %��ԃt�B�[�h�o�b�N
        j = 0;
        for ttt = tt : sample_time : (tt + pc_time)
            j = j + 1;
            if (prefy(i+j) - prefy(i+j-1)) ~= 0
                f  = -(H+G'*P*G)^(-1)*G'*(xi')^(j-1)*P*GR;          %ZMP�t�B�[�h�t�H���[�h��(����̂̓��{�b�g���W�ɂ����鑫��ڕW�ʒu)
                %fd = -(H+G'*P*G)^(-1)*G'*(xi')^j*P*G_d;             %�O���t�B�[�h�t�H���[�h��
                duy = duy + f * (prefy(i+j) - prefy(i+j-1));
            end
        end
        uy = uy + duy;      %�������
        
        x = A_d * x + B_d * ux;     %�d�S�O��(x����)
        y = A_d * y + B_d * uy;     %�d�S�O��(y����)
        
        cog_x = x(1);       %�d�S�O��
        cog_y = y(1);
        output_zmp_x = px;  %�o��ZMP
        output_zmp_y = py;
    end
end