% Author: Max Lu
% Date: Nov 17

%% Load the data first, see data_preprocess.m

%% 
tic
X = [words_train; words_test];
Y = genders_train;
folds = 10;
[n m] = size(words_train);

% ----Generate PCA
% [coef, scores, eigens] = pca(X);
% 
% plot(cumsum(eigens)/sum(eigens));
% save('coef.mat', 'coef');
% save('scores.mat', 'scores');
% save('eigens.mat', 'eigens');
% ----

% ---- Load PCA
% load('coef.mat', 'coef');
% load('scores.mat', 'scores');
% load('eigens.mat', 'eigens');
% ---- 



% ---- Use following code to search for the best number of PC to include
% -- for training:

% acc = []
% for i = 1:40
%     X = scores(1:n, 1:i*20);
%     toc
%     [accuracy, Ypredicted, Ytest] = cross_validation(X, Y, folds, @linear_regression);
%     toc
%     i
%     mean(accuracy)
%     acc = [acc ; mean(accuracy)];
% end
% 
% plot(acc);



% I find that 320 principal components work best.

X = scores(1:n, 1:320);
toc
[accuracy, Ypredicted, Ytest] = cross_validation(X, Y, folds, @linear_regression);
toc
accuracy
mean(accuracy)