% MOVING DATA AROUND

% dimensions of A
A = [1 2; 3 4; 5 6];
sz = size(A)

% first dimension of A
sz = size(A,1)

% Size of the longest dimension
v = [1 2 3 4]
length(v)

% load data in octave 
% load featuresX.dat
% load priceY.dat 
% load('featuresX.dat')

% What variables i have in my Octave space?
who

% Clear features
% >> clear featuresX

% v will be first 10 elements of priceY 
% v = priceY(1:10) 10 x 1

% Save in disc 
% save hello.mat v;

% MANIPULATE DATA

A = [1 2; 3 4; 5 6]

A(3,2); % 6
A(2,:); % Tome toda la segunda fila 
A(:,2); % Tome toda la segunda columna
% 2
% 4
% 6
A([1 3], :); % Todos los elementos cuyos indices sean 1 o 3
% 1 2
% 5 6

% assignment 
A(:,2) = [10; 11; 12]
% 1 10
% 3 11
% 5 12

% Añade otra columna a la derecha
A = [A, [100; 101; 102]];

B = A;

% Todos los elementos de A en un solo vector 
A(:);

% Si tengo A 3x2 y B 3x2
% C = [A B] concatena las dos matrices, 3 x 4
% C = [A; B] next line. concatena en 6x2










