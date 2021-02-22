function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% X has size of 300x2 (300 training examples, with locations x and y)
% centroids have size of 3x2
% K = 3, there are 3 centroids
m = length(X);
% distance is size 300x3
distance = zeros(m,K);

% para cada ejemplo de entrenamiento X(i), se le saca la distancia
% euclidiana con cada uno de los k centroides y se almacena en una
% matriz mxk (o ixj) llamada distancia.
for i = 1:m,
  for j = 1:K,
    difference_1xk = bsxfun(@minus, X(i,:), centroids(j,:));
    distance(i, j) = sum(difference_1xk.^2);
  endfor
endfor
% Si existen 5 centroides, distance almacenará la distancia entre X
% y cada centroide. Al final se elige el centroide con distancia mas
% corta y se almacena en idx
[~, idx] = min(distance, [], 2);

% =============================================================

end

