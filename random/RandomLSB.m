function [Stead_r,bitsnum] = RandomLSB(cover)
Stead_r = cover;


Lena = imread('Lena.tiff');%��ȡ����ͼ��
face = Lena(1:180,1:180);%ȡ1-180���ط����ͼƬ����Ȼ����Ըĳ�������

bitsnum = numel(cover);%ͳ���������ظ���

data = dec2bin(face); %��Ƕ������ת��Ϊ������
data = strcat(char(data)','');%����ת��Ϊ�ַ�����
data = str2num(data(:));%ת��Ϊ��������
data=data';%data����ת��

num = numel(data);

if num>=bitsnum%���Ƕ���ʴ���100%
    for j=1:bitsnum
        if bitget(cover(j),1) ~= data(j)
            %���cover�ĵ�i�����ĵ�����һ��ֵ��date�ĵ�i��ֵ����
            switch cover(j)
                case  0    %��ǡ��cover������0�Ǿ�ֻ��+1
                    Stead_r(j)=Stead_r(j)+1;
                case 255   %��255ֻ��-1
                    Stead_r(j)=Stead_r(j)-1;
                otherwise  %����Ͱ�����ͼ��ĵ�i��ֵ�����һ���������1
                    Stead_r(j)=Stead_r(j)+randsrc(1,1,[-1,1]);
            end
            
        end
        end
    for j=1:num-bitsnum
        if bitget(cover(j),1) ~= data(j)
            switch cover(j)
                case  0   
                    Stead_r(j)=Stead_r(j)+1;
                case 255   
                    Stead_r(j)=Stead_r(j)-1;
                otherwise 
                    Stead_r(j)=Stead_r(j)+randsrc(1,1,[-1,1]);
            end
        end
    end
    
    
    
    
else%Ƕ����С��100%
    for j=1:num
        if bitget(cover(j),1) ~= data(j)
            switch cover(j)
                case  0    
                    Stead_r(j)=Stead_r(j)+1;
                case 255   
                    Stead_r(j)=Stead_r(j)-1;
                otherwise  
                    Stead_r(j)=Stead_r(j)+randsrc(1,1,[-1,1]);
            end
        end
    end
end
end