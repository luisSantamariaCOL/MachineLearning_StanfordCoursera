% Computing on Data

A = [1 2; 3 4; 5 6]

B = [11 12; 13 14; 15 16]

C = [1 1; 2 2]

A * C

% Cada elemento de A multiplicado por un elemento de B
A .* B

% Transpuesta
A'
(A')'

a = [1 15 2 0.5]
val = max(a)
[val, ind] = max(a)

a < 3
% [1 0 0 1 1]

find(a < 3)
% 1 3 4

A = magic(3)
% r and c are row and columns
[r,c] = find(A >= 7)
% r = 
%     1
%     3
%     2
% c = 
%     1
%     3
%     2

% SUM FUNCTION
sum(a) % sums all elements of a
prod(a) % product of all elements of a

% ROUNDS
% floor(a) rounds down
% ceil(a) rounds up 


% this takes the column wise maximum.
max(A,[],1)
% max of first column is 8
% max of second column is 9...
% ans = 8 9 7
max(A,[],2) % per row maximum

max(A(:)) % max element of matrix

% per column sum 
sum(A,1)

% per row sum 
sum(A,2)
















