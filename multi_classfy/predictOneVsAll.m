function p = predictOneVsAll(all_theta, X)
% 给定训练得出的模型参数all_theta,判断X中的每一个样本属于哪一个类。
% 输入all_theta是一个参数矩阵，第i行是第i个逻辑回归分类器的参数。
% 输入X是一个数据矩阵，每一行是一个样本。
% 输出p是一个列向量。其中的第i个元素代表X中的第i个元素属于K个类中的哪一类。
% 比如p = [1;3;1;2]预测4个样本分别属于第1,3,1,2个类。


m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: 完成以下的代码。H是逻辑回归的输出，是一个m行K列的矩阵。m是样本的
%               数量，K是类的数量H(i,j)是第i个样本属于第j个类的概率。然后，你将使用
%               max()函数返回每行最大值的索引位置，也就是预测的类。
%               例如：[a,p] = max(A,[],2);函数将A中每一行的最大值返回到参数a,将
%               最大值的索引值返回到p。
H = 1./(1+exp(-X*all_theta'));
[a,p] = max(H, [], 2) ;    % 返回每行最大值的索引位置，也就是预测的数字

 








% =========================================================================


end
