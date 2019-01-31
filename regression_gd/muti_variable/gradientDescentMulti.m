function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: 进行一次梯度下降运算来更新theta
    % 提示信息见实验报告。
    % 格式如下：
    % theta = %your code%;
    for ii = 1:size(X, 2)
        temp =  theta(ii) - alpha*1/m*sum((X*theta-y).*X(:,ii));
        theta(ii) = temp;
    end
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
