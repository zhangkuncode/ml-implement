function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: 完成用正规方程来求解theta的代码。公式参见实验报告
% 前提是X已经添加了一列截矩项系数1
theta = (inv(X' * X))*X'*y;

% -------------------------------------------------------------

% ============================================================

end
