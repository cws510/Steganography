%%Start
clear
clc%���ȫ��

Toolboxway = uigetdir('Choose your source directory.');%��ȡ��ȡ������·��
addpath(Toolboxway);

img_name = 'Lena.jpg';
jpeg_obj = jpeg_read(img_name);%��ȡlena.jpg�ļ�

InlayNums = input('Please input RandomDatas group number:');

[SecretData] = SecretProducer(InlayNums);%�����������

[stego_name] = F5Stego(img_name,jpeg_obj,SecretData,InlayNums);%F5Ƕ��

[UnlockData] = F5Unlock(stego_name,InlayNums);%F5��ȡ

if isequal(SecretData,UnlockData)%�Ƚ�Ƕ����������ȡ�����Ƿ�һ��
    disp("������������ȡ����һ��");
else
    disp("������������ȡ���ݲ�һ��");
end