%%Start
clear
clc%���ȫ��
cover = imread('1.tiff');%����ͼƬ
[Stead,bitsnum] = LSB_en(cover);%Ƕ�����������������
imwrite(Stead,'Screat.tiff','tiff');%���޸ĺ��ͼƬ���浽�����ļ�����