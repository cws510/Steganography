function [E] = KfangAnalysis(Sample)

bitsnum = numel(Sample);%ͳ�����ظ���

G = linspace(0,0,256);%����һ��ȫ��Ϊ0����СΪ256������

for j=1:bitsnum
    G(Sample(j)+1) = G(Sample(j)+1)+1;%ͳ��ÿ������ֵ�����˶��ٴ�
end

E = 0;
for n = 1:128
    E = E+ power(G(2*n)-G(2*n-1),2); %ͳ�ƿ���������ֵ
end

end

