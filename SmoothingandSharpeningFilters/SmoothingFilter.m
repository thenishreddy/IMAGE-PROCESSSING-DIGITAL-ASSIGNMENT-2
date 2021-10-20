clc;
clear;
close all;
F=double(imread('bwduck.bmp'));
H=F;
I=F;
[rows cols]=size(F);
 A=[1,1,1;1,1,1;1,1,1];
 B=[1,2,1;2,4,2;1,2,1];
G1=zeros(3,3);
G2=zeros(3,3);
for i = 2:rows-1
    for j = 2:cols-1
    
    for k=-1:1
        for l=-1:1
        G1(k+2,l+2)=F(i+k,j+l).*A(k+2,l+2);
        G2(k+2,l+2)=F(i+k,j+l).*B(k+2,l+2);
        end
    end
    sumG1=sum(sum(G1));
    H(i,j)=sumG1./sum(sum(A));
    sumG2=sum(sum(G2));
    I(i,j)=sumG2./sum(sum(B));
    end
end
H = uint8(round(H - 1));
I = uint8(round(I - 1));
figure()
subplot(2,2,[1 2]);
imshow(uint8(F));

title('Input Image for Smoothing Filters');
subplot(2,2,3);
imshow(H);
title('Output Smoothened Image for non-weighted kernel A=[1,1,1;1,1,1;1,1,1]');
subplot(2,2,4);
imshow(I);
title('Output Smoothened Image for weighted kernel B=[1,2,1;2,4,2;1,2,1]');