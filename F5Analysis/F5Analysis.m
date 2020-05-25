%%Start
clear
clc%���ȫ��

Toolboxway = uigetdir('Choose your ToolBox directory.');%��ȡ��ȡ������·��
addpath(Toolboxway);
%% ԭʼͼ��
img_name = 'Boat.jpg';
Origin = jpeg_read(img_name);%��ȡBoat.jpg�ļ�
OriginDct = Origin.coef_arrays{1,1};%��ȡjpeg��dctֵ
Dcttime0 = tabulate(OriginDct(:));%tabulateͳ��dctϵ����ÿ��ֵ���ֵĴ���
%% ����F5��д���ͼ��
img_name = 'Stego-Boat.jpg';
Exam = jpeg_read(img_name);%��ȡStego-Boat.jpg�ļ�
ExamDct = Exam.coef_arrays{1,1};%��ȡjpeg��dctֵ
Dcttime1 = tabulate(ExamDct(:));
%% �ο�ͼ��
stego = imread('Stego-Boat.jpg');
Guess = imcrop(stego,[1,5,512,508]);%ȥ����дͼƬ�����������ݲ�������ͬ�������������µ�ͼƬ
imwrite(Guess,'Guess-Boat.jpg');

img_name = 'Guess-Boat.jpg';
GuessCover = jpeg_read(img_name);%��ȡGuess-Boat.jpg�������ԭͼ�ļ�

GuessDct = GuessCover.coef_arrays{1,1};%��ȡjpeg��dctֵ
Dcttime2 = tabulate(GuessDct(:));

ODct = zeros(1,301);%���������������Ź�������ֵ
EDct = zeros(1,301);
GDct = zeros(1,301);

szO = length(Dcttime0);%�õ�DCTϵ�����ָ���ͳ�Ʊ�ĳ���
szE = length(Dcttime1);
szG = length(Dcttime2);

i=1;
for n = 1:301
    if Dcttime0(i,1) < 0%��DCT�и�ֵ���ֵĴ���������˳����ڹ���������ǰ150λ
        if Dcttime0(i,1) == -151+n%'-x'���ֵĴ�������'151-x'��λ��
            ODct(n) = Dcttime0(i,2);
            i = i+1;
        end
    else%��DCT����ֵ���ֵĴ���������˳����ڹ����������150λ
        ODct(Dcttime0(i,1)+151) = Dcttime0(i,2);
        i = i+1;
    end
    if i == szO+1
        break;%��DCT����ͳ�Ʊ���ÿ�����ֶ����й���������ѭ��
    end
end

i=1;
for n = 1:301
    if Dcttime1(i,1) < 0
        if Dcttime1(i,1) == -151+n
            EDct(n) = Dcttime1(i,2);
            i = i+1;
        end
    else
        EDct(Dcttime1(i,1)+151) = Dcttime1(i,2);
        i = i+1;
    end
    if i == szE+1
        break;
    end
end
i=1;
for n = 1:301
    if Dcttime2(i,1) < 0
        if Dcttime2(i,1) == -151+n
            GDct(n) = Dcttime2(i,2);
            i = i+1;
        end
    else
        GDct(Dcttime2(i,1)+151) = Dcttime2(i,2);
        i = i+1;
    end
     if i == szG+1
        break;
     end
end


       
    
x=-150:1:150;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ
plot(x,ODct','-xb',x,EDct,'-xr',x,GDct,'-xg'); %���ԣ���ɫ�����
axis([-150,150,0,250000])  %ȷ��x����y���ͼ��С
set(gca,'XTick',[-150:10:150]) %x�᷶Χ150-150�����1
set(gca,'YTick',[0:100000:250000]) %y�᷶Χ0-2500000�����100000
legend('Origin','Exam','Guess');   %���ϽǱ�ע
xlabel('Dct')  %x����������
ylabel('times') %y����������