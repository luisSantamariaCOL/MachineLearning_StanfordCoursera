function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% task: Use the cross validation set Xval, yval to determine the best
% C and sigma parameters to use.

C_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
row = 1;

% try all possible pairs (nested loops)
for i = 1:length(C_values),
  for j = 1:length(sigma_values),
    C_val = C_values(i);
    sigma_val = sigma_values(j);
    
    [model] = svmTrain(X, y, C_val, @(x1, x2) gaussianKernel(x1, x2, sigma_val));
    predictions = svmPredict(model, Xval);
    
    prediction_error =  mean(double(predictions ~= yval));
    
    % We are gonna save the result in the matrix
    result(row,:) = [C_val, sigma_val, prediction_error];
    row = row+1;
  endfor
endfor

% =========================================================================

% Getting the index of the minimum error value

[value index] = min(result(:,3));

% C and sigma of the corresponding lowest prediction error value

C = result(index, 1); % first value of the 'index' row of matrix result
sigma = result(index, 2); % second value of the 'index' row of matrix result

end
