%%Start
clear
clc%���ȫ��
cover = imread('Tom.png');%����ͼƬ
subplot(1,3,1);%��figure�ֳ�1*3�Ĳ��֣�����Tom���ڵ�һƬ����
imshow(cover);%��figure�ų�cover
title('����ͼ��');
fid = fopen('Secret.txt','r');%���ı���ȡ�ַ���
word = fgets(fid);%����ȡ���ַ�������word��
fclose(fid);
text(1100,0,'��������:');
text(900,400,word);

%Ƕ�뺯��
[Stead,emD,bitsnum] = LSB_en(cover,word);
subplot(1,3,3);
imshow(Stead);
title('����ͼ��');
imwrite(Stead,'Screat.png','png');