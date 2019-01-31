%% Machine Learning Online Class - Exercise 1: Linear Regression

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions 
%  in this exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%
% x refers to the population size in 10,000s
% y refers to the profit in $10,000s
%

%% Initialization
clear ; close all; clc

%% ==================== Part 1: �������� ====================
% warmUpExercise.m
fprintf('Running warmUpExercise ... \n');
fprintf('5x5 Identity Matrix: \n');
warmUpExercise()

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ======================= Part 2: ����ͼ�� =======================
fprintf('Plotting Data ...\n')
data = load('ex1data1.txt'); % ��ȡ����
X = data(:, 1); y = data(:, 2); % ����һ�к͵ڶ��зֱ�ֵ���������X���������y
m = length(y); % �õ������ĸ���

% Plot Data
% ����Ҫ���plotData.m�еĴ���
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x ��һ��ΪʲôҪ��ô��
theta = zeros(2, 1); % ��ʼ������thetaΪȫ0������

% �����ݶ��½���һЩ����
iterations = 1500; %����1500��ѭ��
alpha = 0.01; % ����ѧϰ��Ϊ0.01

% ����Ҫ����computeCost.m�еĴ���
computeCost(X, y, theta); %��������Ĵ��ۺ���

% �����ݶ��½�
% ����Ҫ����gradientDescent.m�еĴ���
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);
% �����ó���theta��ӡ����Ļ��
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));
fprintf('Final cost value is %f\n',J_history(end));
% ���Ƴ���Ϻõ�����
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

figure; % ���Ƶ��������Դ��ۺ���������
plot(J_history,'r','linewidth',2);
xlabel('iterations')
ylabel('cost value')
title('���������Դ��ۺ���������')

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 4: ���ӻ� J(theta_0, theta_1) =============
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% ����������������м�����ۺ�����ֵ
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% ��J_vals��ʼ��Ϊȫ0�ľ���
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');
title('���ۺ�����ά����ͼ')

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
title('���ۺ�����ά�ȸ���ͼ')
