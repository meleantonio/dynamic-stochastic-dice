function X = cartprodt(input)
% From the MathWorks File Exchange site %
%CARTPROD Cartesian product of multiple sets.
%
%   X = CARTPROD(A,B,C,...) returns the cartesian product of the sets 
%   A,B,C, etc, where A,B,C, are numerical vectors.  
%
%   Example: A = [-1 -3 -5];   B = [10 11];   C = [0 1];
% 
%   X = cartprod(A,B,C)
%   X =
% 
%     -5    10     0
%     -3    10     0
%     -1    10     0
%     -5    11     0
%     -3    11     0
%     -1    11     0
%     -5    10     1
%     -3    10     1
%     -1    10     1
%     -5    11     1
%     -3    11     1
%     -1    11     1
%

numSets = length(input);
for i = 1:numSets,
    thisSet = input{i};
    if ~isequal(prod(size(thisSet)),length(thisSet)),
        error('All inputs must be vectors.')
    end
    if ~isnumeric(thisSet),
        error('All inputs must be numeric.')
    end
    if ~isequal(thisSet,unique(thisSet)),
        error(['Input set' ' ' num2str(i) ' ' 'contains duplicated elements.'])
    end
    sizeThisSet(i) = length(thisSet);
    input{i} = thisSet;
end
X = zeros(prod(sizeThisSet),numSets);
for i = 1:size(X,1),
    
    % Envision imaginary n-d array with dimension "sizeThisSet" ...
    % = length(input{1}) x length(input{2}) x ...
    
    ixVect = ind2subVect(sizeThisSet,i);
            
    for j = 1:numSets,
        X(i,j) = input{j}(ixVect(j));
    end
end