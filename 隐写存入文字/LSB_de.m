function [exD,Output]=LSB_de(Stead,length)

exD = bitget(Stead,1);
%������ת��Ϊ��������������ȡ���λǶ������
k=0;
exD=exD(1:length);
k = 0;
n=length/7;
for i = 1:n
        %bin2dec����һ���ַ�����ʾ�Ķ�������ת����һ��ʮ������
        %num2str��������exD�е���ת�����ַ�����ʾ��ʽ
        %��ascii��������б�����Ϣ
        Output(i) = char(bin2dec(num2str(exD(k+1:k+7))));
        k = 7+k;
end

end