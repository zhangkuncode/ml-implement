%% Machine Learning Online Class
%  Exercise 2: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: 特征归一化 ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('归一化前数据集中前10个样本: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('特征归一化 ...\n');

% 这个函数需要补充
[X, mu, sigma] = featureNormalize(X);

fprintf('特征归一化后的前10个样本: \n');
fprintf(' x = [%.04f %.04f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

X_O = X;
% 给X加上截距项
X = [ones(m, 1) X];

%% ================ Part 2: Gradient Descent ================
% 在这一部分，你要补充计算代价函数和梯度下降的代码。

fprintf('运行梯度下降 ...\n');

% 选择学习率和迭代次数
alpha = 0.1;
num_iters = 400;

% 初始化theta
theta = zeros(3, 1);
% 运行梯度下降，这个函数需要补充
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% 画出迭代次数对代价函数的图
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% 现实梯度下降得出的theta值
fprintf('梯度下降得出的theta值: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% 现在你需要补充下面的代码，来估计一个1650平方尺，3个房间的公寓的价格。
% 注意，特征需要归一化。
% 取消注释以下下的代码，然后补充
x_test = [1650 3];
for i = 1 : length(x_test)
    x_test(i) = (x_test(i) - mean(X_O(:,i)))/std(X_O(:,i)); %归一化第i个特征
end
x_test = [1 x_test]% 从这一步才加入偏置项1，是因为偏置项不需要归一化。

price = x_test*theta; %你也需要修改这一行 预测价格; 

% ============================================================

fprintf(['预测一个 1650 sq-ft, 3 个房间的房价 ' ...
         '(使用梯度下降):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('使用正规方程求解...\n');
% ====================== YOUR CODE HERE ======================
% Instructions: 完成normalEqn.m中的代码，使用正规方程法求解线性回归
%               之后，再预测一下1650平方米，3个房间的房子的房价。

theta = normalEqn(X, y);
% 显示求得的theta值
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');
price = [1 1650 3]*theta;
fprintf(['预测一个 1650 sq-ft, 3 个房间的房价 ' ...
         '(使用使用正规方程):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;
