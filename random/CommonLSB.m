function [Stead_c,bitsnum] = CommonLSB(cover)
Stead_c = cover;


Lena = imread('Lena.tiff');

face = Lena(1:180,1:180);
bitsnum = numel(cover);%ͳ���������ظ���
num = numel(face);%ͳ���������ظ���

data = dec2bin(face);
data = strcat(char(data)','');
data = str2num(data(:));



if num>bitsnum%������Ƕ���ʴ���100%
    for j=1:bitsnum
        Stead_c(j) = bitset(cover(j),1,data(j));
        %��cover(j)�ĵ�����1������data(j)���档
    end
    for j=1:num-bitsnum
        Stead_c(j) = bitset(cover(j),2,data(bitnun+j));
        %��cover(j)�ĵ�����2������data(j)���档
    end
else%���Ƕ����С��100%
    for j=1:num
    Stead_c(j) = bitset(cover(j),1,data(j));
    %��cover(j)�ĵ�����1������data(j)���档
    end
end
end