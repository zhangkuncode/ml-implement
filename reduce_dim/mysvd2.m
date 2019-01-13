function [u1 s1 v1] = mysvd(img, k)

tmp = imread('lenna.jpg');
img = rgb2gray(tmp);

% matlab的svd函数的第一个输入必须为单精度值或双精度值
img = double(img); 

[u,s,v] = svd (img);
% single value decomposition公式 
% 注意最后一个乘的是v的转置transpose
% img = u * s * v';

k = 15; 

u1 = u(:,1:k);
s1 = s(1:k,1:k);
s1
% 注意 v1 是取 v的transpose 的 前k 行 all列 
% 下面数据恢复时不用再乘v1的transpose了
v = v';
v1 = v(1:k,:);

rdc_img = u1 * s1 * v1;
