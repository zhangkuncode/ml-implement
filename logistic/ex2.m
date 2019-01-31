%% Machine Learning Online Class - Exercise 2: Logistic Regression
%
%  Instructions
%  ------------
% 
%  本文件将帮助你完成逻辑回归实验。你将不需要修改本文件中的任何内容。
%  为了完成本次实验，你需要补充以下的文件
%     sigmoid.m  % sigmoid函数
%     costFunction.m % 计算逻辑回归的代价函数和梯度值
%     predict.m % 对新的数据进行预测
%     costFunctionReg.m % 正则化的代价函数
%
%

%% Initialization
clear ; close all; clc

%% 读取数据
%  数据中的前两列是两次考试的成绩，第三列是是否被录取的决定。

data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% ==================== Part 1: Plotting ====================
%  将数据化成散点图

fprintf(['绘制数据 + 表示正样本 (y = 1)， o ' ...
         '表示负样本 (y = 0).\n']);

plotData(X, y);


hold on;
% 显示x轴和y轴的注释
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% 显示标签
legend('录取', '未录取')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ============实现sigmoid函数========================
disp(['sigmoid函数输入：'])
z_test = [-2 0 3]
disp(['sigmoid函数输出：'])
a_test = sigmoid(z_test)

%% ============ Part 2: 计算代价函数和梯度 ============
%  在这个部分，你需要实现逻辑回归的代价函数，以及计算梯度值。
%  补充costFunction.m函数

%  m表示训练样本个数，n表示训练样本的特征数
[m, n] = size(X);

% 加入截距项
X = [ones(m, 1) X];

% 初始化theta值为0
initial_theta = zeros(n + 1, 1);

% 计算初始情况下的cost和梯度。你需要完成costFunction.m函数。
[cost, grad] = costFunction(initial_theta, X, y);

fprintf('在初始状态theta (zeros)时代价函数的值: %f\n', cost);
fprintf('在初始状态theta (zeros)时的梯度值: \n');
fprintf(' %f \n', grad);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% ============= Part 3: Optimizing using fminunc  =============
%  在这部分练习中，你需要使用matlab自带的fminunc优化函数来得到逻辑回归的参数theta


%  设置fminunc函数的一些选项 比如说使用梯度，最多迭代次数为400
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('fminunc优化后代价函数的值: %f\n', cost);
fprintf('得到的theta值: \n');
fprintf(' %f \n', theta);

% Plot Boundary
plotDecisionBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('录取', '未录取')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============== Part 4: Predict and Accuracies ==============
%  当你完成了参数theta的估计，你需要使用得到的预测模型来预测新的数据的输出。在这个
%  部分里，你要用楼及回归模型来预测一个学生被录取的可能性，他的第一次考试成绩是45分
%  第二次考试成绩是85分。
%
%  此外，你还需要计算得出的模型在训练集上的正确率。你需要补充predict.m函数。


%  预测一个学生被录取的可能性，他的第一次考试成绩是45分
%  第二次考试成绩是85分。

prob = sigmoid([1 45 85] * theta);
fprintf(['对于一个两次考试成绩分别为 45 和 85的学生, 我们预测他 ' ...
         '被录取的概率是： %f\n\n'], prob);

% 得出的模型在训练集上的正确率。
p = predict(theta, X);

fprintf('训练集上的正确率: %f\n', mean(double(p == y)) * 100);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;
