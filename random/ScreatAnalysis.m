%%Start
clear
clc%���ȫ��
Fileway=uigetdir('Choose your source directory.');%��ȡ��ȡͼ���·��
cd(Fileway);%����ͼ���
allphotos=struct2cell(dir('*tiff'));%ֻ����8λtiff�ļ�
[k,len]=size(allphotos);%�õ��������ļ�����
len=len-1;
KafangValue = zeros(len,3);%����һ��len*3�Ķ�ά����

for i=1:len%���������ļ�
    photo = allphotos{1,i};
    cover = imread(photo);
    Sample = cover;
    [E] = KfangAnalysis(Sample);%��������
    clc; %��������д��ڵ�����

    KafangValue(i,1)=E;
    
    
    [Stead_c,~] = CommonLSB(cover);%��ͨ��д������Ƕ��
    Sample = Stead_c;
    [E] = KfangAnalysis(Sample);%��������

    KafangValue(i,2)=E;
    
    
    [Stead_r,bitsnum] = RandomLSB(cover);%�����1��д������Ƕ��
    Sample = Stead_r;
    [E] = KfangAnalysis(Sample);%��������

    KafangValue(i,3)=E;
    
    
end

%����һ����״ͼ��չʾÿ�ο���������ֵ
b=bar(KafangValue);
grid on;
ch = get(b,'children');
legend('����дԭͼ','LSB����д','LSB�����1��д');
xlabel('��дͼƬ ');
ylabel('��������ֵ');