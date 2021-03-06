function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
% J = (1/(2*m))*sum( ((X*theta)- y).^2)
% size(X) 97 2
% size(theta) 2 1
% J = 1/(2*m) * sum((X*theta - y).^2);

predictions = X*theta; % predictions of hypothesis on all m examples
sqrErrors = (predictions - y) .^2;
J = 1/(2*m) * sum(sqrErrors); % cost function 




% =========================================================================

end
