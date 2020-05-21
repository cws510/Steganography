%%Start
clear
clc%���ȫ��
cover = imread('Lena.tiff');
%subplot(131);
%imshow(cover);
%title("����ͼ��");
[height,weight] = size(cover);
H = zeros(1,11);%����һ�����������洢������дPSNR��ֵ
C = zeros(1,11);%����һ�����������洢��ͨ��дPSNR��ֵ


InlayNums = 3333;
for n = 1:11

[SecretData] = SecretProducer(InlayNums);%�����������
[Output_H] = HMStego(cover,SecretData,InlayNums);
[Output_C] = CommonLSB(cover,SecretData,InlayNums);

[PS_H] = PSNR(Output_H,cover);%������дPSNR����
H(n) = PS_H;
[PS_C] = PSNR(Output_C,cover);%��ͨ��дPSNR����
C(n) = PS_C;


y= 1;
InlayNums=InlayNums+3333;
end

x=1:1:11;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ
plot(x,H,'-*b',x,C,'-or'); %���ԣ���ɫ�����
axis([0,12,50,75])  %ȷ��x����y���ͼ��С
set(gca,'XTick',[0:1:12]) %x�᷶Χ0-12�����1
set(gca,'YTick',[50:5:75]) %y�᷶Χ80-100�����5
legend('HMStego','ComonLSB');   %���ϽǱ�ע
xlabel('Ƕ��������(*10000)')  %x����������
ylabel('PSNRֵ') %y����������
