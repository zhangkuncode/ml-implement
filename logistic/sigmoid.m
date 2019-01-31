function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z)

% 该函数输出和输入z一样大小的矩阵，其中g_ij = sigmoid(z_ij) 
g = 0.5*ones(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: 计算z中每一个元素的sigmoid值 (z可以是一个值，一个向量
%               或者一个矩阵).
% 在下面补充计算g的函数,指数函数用exp()函数来实现。
% g = %your code%;
g= 1./(1+exp(-z));

% =============================================================

end
