%%Start
clear
clc%���ȫ��
cover = imread('Lena.tiff');
%subplot(131);
%imshow(cover);
%title("����ͼ��");
[height,weight] = size(cover);

%�Ӽ��̻�ȡǶ�����ݵ������Ŀ
InlayNums = input('Please input RandomDatas group number:');

[SecretData] = SecretProducer(InlayNums);%�����������

[Output] = HMStego(cover,SecretData,InlayNums);%������д

[UnlockData] = HMUnlock(Output,InlayNums);%������ȡ

if isequal(SecretData,UnlockData)%�Ƚ�Ƕ����������ȡ�����Ƿ�һ��
    disp("������������ȡ����һ��");
else
    disp("������������ȡ���ݲ�һ��");
end