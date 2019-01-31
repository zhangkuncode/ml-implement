function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: 在下面补充代码，以实现正规化的代价函数和梯度

% %取消注释，并补充以下的代码
n=size(theta); %特征的数量
h_theta = sigmoid(X*theta); %一个m维向量，包括m各样本的预测值
% %%在下面补充代价函数的正则项，注意，不要正则化theta(1)项
J = 1/m * sum( -y.*log(h_theta) - (1-y).*log(1-h_theta) ) + lambda/(2*m)*sum(theta(2:end).^2);
%% 梯度的计算
grad(1) = (1/m)*sum( (h_theta-y).*X(:,1) ); % 第一个元素的梯度分别对待，不进行正则化
for i=2:n
    grad(i) = (1/m)*sum( (h_theta-y).*X(:,i) ) + lambda/m*theta(i);  % 其余的梯度加入正则项
end

% =============================================================

end
