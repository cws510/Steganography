%%Start
clear
clc%���ȫ��

Fileway=uigetdir('Choose your source directory.');%��ȡ��ȡͼ���·��
cd(Fileway);%����ͼ���
allphotos = (dir('*tiff'));%ֻ����8λtiff�ļ�
len=length(allphotos);%�õ��������ļ�����

%qualityrate = input('Please input RandomDatas group number:');

for i =1:len
    tiffile = fullfile(Fileway,allphotos(i).name);%��ȡ����tiff�ļ�·��
    ImgData =imread(tiffile);%��ȡ��Ӧ�ļ�
    [path,name,ext] = fileparts(tiffile);
    filename = strcat(name,'.jpg');%��ȡ�ļ���
    jpgfile = fullfile(Fileway,filename);
    for j =1:9%��Ӧ��ͬ��������������
        qualityrate = j*10;
        ImgName = [name,'_',num2str(qualityrate),'.jpg'];%Ϊ�ļ�������ָ�������Ӳ���
        imwrite(ImgData,ImgName,'JPEG','Quality',qualityrate);%���Ϊ
    end
end
cd('..');%���ش����ļ���


