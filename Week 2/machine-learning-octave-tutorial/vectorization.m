% VECTORIZATION

% Unvectorized implementation

% prediction = 0.0;
% for j = 1:n1,
%   prediction = prediction + theta(j) * x(j);
% endfor

% Vectorize implementation

prediction = theta' * X;

% Gradient descent for theta0 to theta2 (n=2)

% theta = theta - alpha*(vector delta)
    % where delta = 1/m sum(prediction - y)*x
    
% theta is Rn+1, alpha is a real number, and delta is Rn+1 vector
% theta : vector substraction
