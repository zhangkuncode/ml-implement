function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% 
%     X是一个矩阵，每一列是一个特征，每一行是一个样本。
%     你需要对每一个特征分别进行归一化。
%     首先，对特征的每一个维度（X中的每一列），计算平均值，和方差。
%     你将使用mean()和std()函数。
%     并且将平均值存储在变量mu中。求平均值应使用mean()函数。
%     大致框架如下。

% for i = 1 : size(X,2) % 对每一个特征归一化
%     mu(i) = %your code%; %计算第i个特征的均值
%     sigma(i) = %your code%; %计算第i个特征的标准差
%     X_norm(:,i) = %your code%; 归一化第i个特征
% end

for i = 1 : size(X,2) % 对每一个特征归一化
    mu(i) = mean(X(:,i)); %计算第i个特征的均值
    sigma(i) = std(X(:,i)); %计算第i个特征的标准差
    X_norm(:,i) = (X(:,i)-mu(i))/sigma(i);%your code%; 归一化第i个特征
end

% ============================================================

end
