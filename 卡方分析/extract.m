function [output,bitsnum] = extract(photo)
output = photo;
bitsnum = numel(photo);%ͳ�����ظ���

output = bitget(output,1);%������ͼƬ����ײ�����������

for j=1:bitsnum
    if output(j) == 1%ѭ��������Ǹ���������0�򲻸Ķ�
        for i=1:8%��������ƴ�����1���Ͱ�����������ĳɴ��ף�����Աȶ�
        output(j) = bitset(output(j),i,1);
        i = i+1;
        %��cover(j)�ĵ�����1������data(j)���档
        end
    end
end
output = uint8(output);%��������ײ��ֵ�����ͼƬ��unit8��ʾ
end