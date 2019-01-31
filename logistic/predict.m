function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: 
%               在下面补充代码，使用逻辑回归来进行预测。输出值p是一个向量，
%               如果这个学生被录取，则输出1，否则输出0.
% 大致框架如下面的代码。

h = sigmoid(X*theta); % h是一个向量，是每一个样本的预测值。

for i=1:m
    if h(i) > 0.5 % 如果h(i)满足什么条件则输出1
        p(i)=1;   
    else  % 如果h(i)满足什么条件则输出0
        p(i)=0;
    end
end





        
% =========================================================================


end
