function [stego_name] = F5Stego(img_name,jpeg_obj,SecretData,InlayNums)
%F5_STEGO F5Ƕ�뺯������

jpeg_dct = jpeg_obj.coef_arrays{1,1};%��ȡjpeg��dctֵ
Stead = mod(jpeg_dct,2);%��һ��Stead��ȡ����ͼ�������ֵ���е�����һ������
Output = jpeg_dct;

%����һ����������
Haming = [0,0,0,1,1,1,1;0,1,1,0,0,1,1;1,0,1,0,1,0,1];
C = zeros(1,InlayNums*3);%����һ���յ������ȡplace�Ķ�������ʽ
place = zeros(1,InlayNums);%�ÿյ�place�������洢ÿ��λ�����޸ĵ�λ��


p=0;
k=0;
for n = 1:InlayNums
    B = [0,0,0];%�ÿյ�B�������洢����������ֵ
    for i = 1:3
        for j = 1:7
            %���������ԭͼ����ײ����ݾ����
            B(i)=B(i)+Haming(i,j)*Stead(7*(n-1)+j);
        end
        if B(i)~=0
            B(i)= mod(B(i),2);%��2ȡ��
        end
    end
    
    for m = 1:3
        if B(m)~=SecretData(m+p)
            C(m+p)=1;%��������˵õ��Ľ������������ȡ���
        end
    end
   
    %�����õ������ݰ��ն�����ת����ʮ������
    place(n) = bin2dec(num2str(C(k+1:k+3)));
    
    p=p+3;
    k=k+3;
end
%bin2dec����һ���ַ�����ʾ�Ķ�������ת����һ��ʮ������

for h = 1:InlayNums
    if place(h)~=0%���Ҫ�޸�����λ�õ�ֵ����0
        Output((h-1)*7+place(h)) = jpeg_dct((h-1)*7+place(h))+randsrc(1,1,[-1,1]);
    end
end

stego_name = strcat('stego-',img_name);%Ϊ�ļ���ǰ����stego-
jpeg_obj.coef_arrays{1,1} = Output;%�޸�jpeg�ļ���DCTϵ��
jpeg_write(jpeg_obj,stego_name);%���Ϊ

end

