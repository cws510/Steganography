function [flag] = compare(photo,flag)

bitsnum = numel(photo);%ͳ�����ظ���

G = linspace(0,0,256)%����һ��ȫ��Ϊ0����СΪ256������

for j=1:bitsnum
    G(photo(j)+1) = G(photo(j)+1)+1;%ͳ��ÿ������ֵ�����˶��ٴ�
end

subplot(1,3,3)%��figure�ֳ�1*3�Ĳ��֣�ֱ��ͼ���ڵ�����
bar(G,0.2);%����ֱ��ͼ��ʾ����ֵ���ֵĴ�����
title('����ֵ������ֱ��ͼ');

E = 0;
for n = 1:128
    E = E+ power(G(2*n)-G(2*n-1),2); %ͳ�ƿ���������ֵ
end
if E<400000
    flag = 0;
end
end
