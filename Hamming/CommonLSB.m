function [Output_C] = CommonLSB(cover,SecretData,InlayNums)
Output_C = cover;

    for j=1:InlayNums*3
    Output_C(j) = bitset(cover(j),1,SecretData(j));
    %��cover(j)�ĵ�����1������data(j)���档
    end
end