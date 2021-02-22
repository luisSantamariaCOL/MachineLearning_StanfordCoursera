function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%


% size(theta) 3 1
% size(h); 100 1
% size(X) 100 3
% size(y) 100 1
#size(y') 1 100
% size(1-y) 100 1
% size(1/m) 1 1
% size(h-y) 100 -1
z = X*theta;
h = sigmoid(z);
%           (100x1)*(100x1) - (100x1)*(100x1)
J = (1/m) * sum( -y.*log(h) - (1-y).*log(1 - h));
grad = (1/m) * (X')*(h - y);

% =============================================================

end
