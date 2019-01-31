%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

%% Initialization
clear ; close all;

%% Setup the parameters you will use for this part of the exercise
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: 读取并可视化数据 =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('读取并可视化数据 ...\n')
load('ex4data1.mat'); % training data stored in arrays X, y
m = size(X, 1); % 获取样本的数量，即X有多少行。 

% 随机选择100个数字进行可视化
rand_indices = randperm(m);     % 打乱顺序
X_show = X(rand_indices(1:100), :); % 选取打乱顺序后的前100个数字
displayData(X_show);  % 可视化

% 你需要做的：
% 取出X中的第1个样本(第一行)，转化成20*20的图片（矩阵），然后可视化出来。
% 提示：把向量转化为矩阵，你可以使用reshape()函数，例如 im = reshape(a, [m n]); 命令
% 将a转化为一个m行n列的矩阵。
% 在下面插入你将第一个样本从向量转化为矩阵的代码；
%% your code （不一定只有一行）%%
img = X(1,:);
img = reshape(img, [20, 20]);

% 可视化：
% 提示：figure;命令打开一个新的图形，以免覆盖上一个图形。
% imshow(a)函数将矩阵a显示图片。可查看帮助doc imshow。
% 在下面插入你显示图像的代码。
%% your code （不一定只有一行）%%
imshow(img);

disp('Paused. Press any key to continue ...')
pause;
%% =========== Part 2: 随机划分训练集和测试集 =============
% 在5000个数据中随机选取4500个作为训练集,其他的作为测试集。
% 使用randsample()命令进行随机取数。例如randsample(1:100,10)是从1到100中随机取10个数。
% 使用setdiff()命令进行取补集运算。例如setdiff(1:100,a)是取1:100个数中除去a中包含的数以外的其他数。

% % 补充以下代码
index_train = randsample(1:5000, 4500);   %在1:5000个数中随机取4500个作为训练集样本的编号
index_test = setdiff(1:5000, index_train);  % 其他的作为测试集样本的编号
X_train = X(index_train,:); % 取出X中行号为index_train的作为训练集
X_test = X(index_test,:); %取出X中行号为index_test的作为测试集
y_train = y(index_train); % 取出y中编号为index_train的元素作为训练集的目标值
y_test = y(index_test);  % 取出y中编号为index_test的元素作为训练集的目标值

disp('训练测试集分割完毕');
disp('Paused. Press any key to continue ...')
pause;

%% ============ Part 2: 逻辑回归训练 ============
%  在这个部分中，你需要调用oneVsAll函数来训练的到逻辑回归的变量all_theta。
%  请查看oneVsAll.m函数的说明。

fprintf('\n训练多分类逻辑回归...\n')

% %你需要做的： 
% %首先设定正则化参数lambda设为0.1，然后调用onesVsAll函数，在训练集上训练逻辑回归模型，。
%% your code (不止一行) %%
lambda = 0.1;
all_theta = zeros(num_labels, (20*20+1));
all_theta = oneVsAll(X, y, num_labels, lambda);

disp('参数all_theta训练完毕')
disp('Paused. Press any key to continue ...')
pause;

%% ================ Part 3: 在训练集和测试集上评估你训练处的模型的准确率 ================
% 首先，你要完成补充predictOneVsAll.m中的代码,实现分类预测。提示见实验报告。
pred_train = predictOneVsAll(all_theta, X_train); %对训练集进行预测

% 在下面补充计算训练集正确率(accuracy_train)的代码。
accuracy_train = sum(pred_train==y_train)/4500;
fprintf('\n逻辑回归训练集正确率: %f\n', accuracy_train * 100);

pred_test = predictOneVsAll(all_theta, X_test); %对测试集进行预测

% 在下面补充计算训练集正确率(accuracy_train)的代码。
accuracy_test = sum(pred_test==y_test)/500;
fprintf('\n逻辑回归测试集正确率: %f\n', accuracy_test * 100);

disp('Paused. Press any key to continue ...')
pause;
%% ================ Part 4: 神经网络的前向传播 ================
% 在这个练习中，你将实现神经网络的前向传播。该神经网络的网络参数已经训练好，
% 我们只需要实现前向传播的预测过程。

fprintf('\n读取神经网络参数 ...\n')

% Load the weights into variables Theta1 and Theta2
load('ex4weights.mat');

%% ================= Part 3: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.
%  当神经网络训练完成后，我们将会用它去预测

pred_train = predict(Theta1, Theta2, X_train);
% 在下面补充计算训练集正确率(accuracy_train)的代码。
accuracy_train = sum(pred_train==y_train)/4500;
fprintf('\n神经网络训练集正确率: %f\n', accuracy_train * 100);

pred_test = predict(Theta1, Theta2, X_test);
% 在下面补充计算训练集正确率(accuracy_train)的代码。
accuracy_test = sum(pred_test==y_test)/500;
fprintf('\n神经网络测试集正确率: %f\n', accuracy_test * 100);




