%%Start
clear
clc
cover = imread('Screat.png');
subplot(1,3,1);
imshow(cover);
title('������ͼ��');
Stead = cover;
%��ȡ����
length = input('Please input arrange number:');
%�˴���Ҫ��ǰ֪��������Ϣ�Ĵ�С���������ɴ��ݷ���֪
length = 7*length;%*7����Ϊascii������λ���������������
[exD,Output]=LSB_de(Stead,length);
text(1100,0,'��������:');
text(1000,400,Output);