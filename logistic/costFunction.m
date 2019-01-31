function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % 训练样本数

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));




% ====================== YOUR CODE HERE ======================
% Instructions: 首先计算特定theta值下的代价函数J.
%               然后计算代价函数对theta的倒数
%
% Note: 倒数应该与theta具有相同的维度
% 你的代码应具有以下形式,取消注释以下代码并补充
% h_theta = sigmoid(%your code%); % 当参数为theta时的预测值
% J = 1/m*sum(-y.*%your code% - (1-y).*%your code%); %代价函数，公式见实验报告。log()函数取对数
% n = size(X,2);% 特征数目
% for j = 1 : n
%     grad(j) = 1/m*sum(%your code%);
% end


h_theta = sigmoid(theta); % 当参数为theta时的预测值
J = 1/m*sum(-y.*log(sigmoid(X*theta)) - (1-y).*log(1-sigmoid(X*theta))); %代价函数，公式见实验报告。log()函数取对数
n = size(X,2);% 特征数目

for j = 1 : n
    grad(j) = 1/m*sum((sigmoid(X*theta)-y).*X(:,j));
end

% =============================================================

end
