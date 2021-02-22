function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Theta1        has size 25 x 401
% Theta2        has size 10 x 26
% nn_params     has size 10285 x 1
% input layer   has size 400
% hidden layer  has size 25
% output layer  has size 10
% X             has size 5000 x 400
% y             has size 5000 x 1
% but y values in ex4 are a matrix, instead of a vector. 

% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%

% FEED FORWARD AND COST FUNCTION

% y_matrix      has size 5000 x 10
y_matrix = eye(num_labels)(y,:);

a1 = [ones(m,1),X];

z2 = a1*Theta1'; % 5000x25
a2 = sigmoid(z2);

a2 = [ones(m,1), a2]; % 5000x26

z3 = a2*Theta2'; % 5000 x 10
a3 = sigmoid(z3);

[maxvalue, p] = max(a3, [], 2);

% the 'h' argument inside the log() function is exactly a3
% first sum() outputs an 1 x 10 vector.
% J (Cost) should be a scalar value.
% J = (1/m)* sum(-y_matrix.*log(a3) - (1-y_matrix).*log(1-(a3))) -> 1 x 10
J = (1/m)* sum(sum(-y_matrix.*log(a3) - (1-y_matrix).*log(1-(a3))));

% REGULARIZED COST FUNCTION (see ex4.pdf Page 6)
% sum the (:,2:end) columns of Theta (excluding Theta column for bias unit)
reg_term_1 = sum(sum(Theta1(:,2:end).^2)); % scalar value
% it's the same as 
% regularization_term_1 = sum(Theta1.^2); % 1 x 401
% regularization_term_1 = sum(regularization_term_1); 

reg_term_2 = sum(sum(Theta2(:,2:end).^2)); % scalar value

regularization = (lambda/(2*m)).*(reg_term_1 + reg_term_2);

J = J + regularization;



% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%


%%% Backpropogation (Vectorized Implementation)

a1 = [ones(m,1),X]; % 5000 x 401

z2 = a1*Theta1'; % 5000 x 25
a2 = sigmoid(z2); % 5000 x 25
a2 = [ones(m,1), a2]; % 5000x26

z3 = a2*Theta2'; % m x num_labels -> 5000 x 10
a3 = sigmoid(z3); % m x num_labels -> 5000 x 10
  
delta_3 = (a3 - y_matrix); % 5000 x 10
  
% Excluding the first column of Theta2 is because the hidden
% layer bias unit has no connection to the input layer
% size (m x r)(r x h) --> (m x h).
delta_2 = (delta_3*Theta2(:,2:end)).*sigmoidGradient(z2); % 5000 X 25
  
Delta1 = delta_2'*a1; % size is (h x m)(m x n) --> (h x n)
Delta2 = delta_3'*a2; % size is (r x m)(m x [h+1]) --> (r x [h+1])

Theta1_grad = (1/m)*(Delta1);
Theta2_grad = (1/m)*(Delta2);

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% first column of Theta1 and Theta2 to all-zeros.
Theta1(:,1) = 0;
Theta2(:,1) = 0;

Theta1 = (lambda/m)*Theta1;
Theta2 = (lambda/m)*Theta2;

Theta1_grad = Theta1_grad + Theta1;
Theta2_grad = Theta2_grad + Theta2;
















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
