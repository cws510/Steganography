function [Stead,bitsnum] = LSB_en(cover)
Stead = cover;

bitsnum = numel(cover);%ͳ�����ظ���

ModifyRate = input('Please input arrange number: (without%)');
%�Ӽ��̻�ȡ��������Ƕ����
i=bitsnum*ModifyRate/100;%iΪǶ��ĸ���

if i>=bitsnum%������Ƕ���ʴ���100%
    for j=1:bitsnum
        Stead(j) = bitset(cover(j),1,randi([0 1],1,1));
        %��cover(j)�ĵ�����1������data(j)���档
    end
    for j=1:i-bitsnum
        Stead(j) = bitset(cover(j),2,randi([0 1],1,1));
        %��cover(j)�ĵ�����2������data(j)���档
    end
else%���Ƕ����С��100%
    for j=1:i
    Stead(j) = bitset(cover(j),1,randi([0 1],1,1));
    %��cover(j)�ĵ�����1������data(j)���档
    end
end


end