function [UnlockData] = F5Unlock(stego_name,InlayNums)
%F5UNLOCK ���庯��
jpeg_cover = jpeg_read(stego_name);%��ȡstego-lena.jpg�ļ�
jpeg_dct = jpeg_cover.coef_arrays{1,1};
Stead = mod(jpeg_dct,2);%��һ��Stead��ȡ����ͼ�������ֵ���е�����һ������

UnlockData  = zeros(1,3*InlayNums);
%����һ����������
Haming = [0,0,0,1,1,1,1;0,1,1,0,0,1,1;1,0,1,0,1,0,1];

p=0;
for n = 1:InlayNums
      B = [0,0,0];%�ÿյ�B�������洢����������ֵ
    for i = 1:3
        for j = 1:7
            %���������ԭͼ����ײ����ݾ����
            B(i)=B(i)+Haming(i,j)*Stead(7*(n-1)+j);
        end
        if B(i)~=0
            B(i)= mod(B(i),2);%�Ѿ�����˽����2ȡ��
        end
    end

    for m=1:3
        UnlockData(m+p)=B(m);%��B�е��������δ�Ž�UnlockData
    end
    
    p=p+3;
end


end