%%Start
clear
clc %����
photo = imread('Screat.tiff');%��������ͼ��
subplot(1,3,1);%��figure�ֳ�1*3�Ĳ��֣����Ѵ��������ڵ�һƬ����
imshow(photo);%��figure��photo��չʾ
title('������ͼ��');
 
[output,bitsum] = extract(photo);%���ͼ��ĵײ�����
subplot(1,3,2);%��figure�ֳ�1*3�Ĳ��֣����Ѵ��������ڵڶ�Ƭ����
imshow(output);%չʾ��ײ�ֽ�����ֵ�ķֲ�
title('��ײ�ֽ�');
imwrite(output,'Screat1.tiff','tiff');%����ײ�ķֽ�����ͼ���

flag = 1;
[flag] = compare(photo,flag);%��������
if flag==1
    text(20,2000,'������ͼƬ��ԭͼ��');
else
    text(20,2000,'������ͼƬ�������ܣ�');
end
    