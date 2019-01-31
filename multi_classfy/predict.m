function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% 补充以下代码
X = [ones(m, 1) X];% 给X加上偏执项，即在左边加一列
% % 由第一层激活值（即X）和Theta1求第二层激活值a2;
% a2 = %your code%;   % 第二层激活函数输出
% % 给a2加上偏执项，即在左边加一列
% a2 = %your code%;        % 第二层加入b
% % 由第二层激活值a2和Theta2求第三层激活值a3,即输出
% a3 = %your code%;  

% % 和逻辑回归相似，返回每行最大值的索引位置，也就是预测的数字。使用max()函数。
% [a,p] = %your code%;               % 返回每行最大值的索引位置，也就是预测的数字





% =========================================================================


end
