clear %�������������
clc %�������������
cover = imread('2.tiff');%��������ͼ������
subplot(231);%����������ʾͼ�񣬴˱����˼Ϊ��������ʾ2*3����ͼ���ڵ�һ����ͼ�л�ͼ
imshow(cover);%��ʾ����ͼ���Զ��������ݵķ�Χ�Ա�����ʾ
title('����ͼ��');%���ñ���
Lena = imread('Lena.tiff');%��ȡ����ͼ��
subplot(232);
imshow(Lena);
title('����ȡͼ��');
face = Lena(1:180,1:180);%��ȡ��Ƕ������
subplot(233);
imshow(face);
title('��������');

[Stead_r,bitsnum] = RandomLSB(cover);%�����1�ķ�ʽ��д������
subplot(234);
imshow(Stead_r);
title('����ͼ��');

[Output] = LSB_read(Stead_r);%������ȡ��ͼ��ָ�����
subplot(235);
imshow(Output);
title('��ȡ����');

if isequal(face,Output)%�Ƚ�Ƕ����������ȡ�����Ƿ�һ��
    disp("������������ȡ����һ��");
else
    disp("������������ȡ���ݲ�һ��");
end