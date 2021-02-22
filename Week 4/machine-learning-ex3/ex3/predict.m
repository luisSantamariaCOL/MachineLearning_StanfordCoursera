function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% 400 input layer units
% 25 hidden layer units
% 10 output layer units 
% Agregamos la caracteristica X0 a cada dato de entrada (X0 = 1)
X = [ones(m,1),X];

% 5000 datos de entrenamiento con 401 caracteristicas X0 a X400
% size(X); % 5000x401
% size(Theta1); %25x401
% size(Theta2); % 10x26
a1 = X;

z2 = a1*Theta1'; % 5000x25
a2 = sigmoid(z2);

a2 = [ones(m,1), a2]; % 5000x26
z3 = a2*Theta2'; % 5000x10
a3 = sigmoid(z3);
[maxvalue, p] = max(a3, [], 2);
% hx 5000x10
% p 5000x1 
% 5000 datos de salida







% =========================================================================


end
