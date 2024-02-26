clc
clear all
A = [1 1 1 0;2 -1 0 -1];
b = [6;9];
C = [3 -5 0 0];
m = size(A,1);
n = size(A,2);
nCm = nchoosek(n,m);
pair = nchoosek(1:n,m);
bfs = [];
basicSol = [];
for i = 1 : nCm
    y = zeros(n,1);
    basicvarIndex = pair(i,:)
    a = A(:, basicvarIndex);
    x = a\b;
    y(basicvarIndex)=x;
    basicSol =[basicSol y];
    if(y >=0)
        bfs = [bfs y]; 
    end
end
f = @(x)C*x;
cost = f(bfs)
[fmin, index] = min(cost)
optsol = bfs(:,index)