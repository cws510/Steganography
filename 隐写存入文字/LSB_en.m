function [Stead,emD,bitsnum] = LSB_en(cover,word)
Stead = cover;
num = numel(cover);%ͳ�����ظ���
data = dec2bin(word);%ת������
data = strcat(char(data)','');% ת���ַ�����
data = str2num(data(:));%�ַ�����ת����������

bitsnum =numel(data);

i=bitsnum;
for j=1:i
    Stead(j) = bitset(cover(j),1,data(j));
    %��cover(j)�ĵ�����1������data(j)���档
end
emD=data(1:bitsnum);
end