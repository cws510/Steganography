function [Output] = LSB_read(stegoI)
% bitget:������ת���ɶ�������������ȡ���λ��������
exD = bitget(stegoI,1);%��ȡ����ͼ�����λǶ�����ݡ�

%�ع���Ƕ���Faceͼ��
Output = uint8(zeros(180,180));
k = 0;
for i = 1:180*180
        %bin2dec����һ���ַ�����ʾ�Ķ�������ת����һ��ʮ������
        %num2str��������exD�е���ת�����ַ�����ʾ��ʽ
        %��ʾͼ����unit8(�޷���8λ����)����Ϊͼ��ı�׼���ݸ�ʽ
        Output(i) = uint8(bin2dec(num2str(exD(k+1:k+8))));
        k = k + 8;
end

end