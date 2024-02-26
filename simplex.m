clc
clear
%Step 1 input the given problem
a = [5 4;2 5; 3 6];
b = [9;7;10];
c = [4 7];
%Step 2 Standadard form
[m,n] = size(a)
s = eye(m)
A = [a s b]
cost = zeros(1, size(A,2));
cost(1:n) = c;

%Step 3 Decide basic variables
bv = n + 1 : size(A,2) - 1

%Step 4 Compute Zj - Cj
ZjCj = cost(bv) * A - cost
zc = ZjCj(1:end - 1)
if any(zc <0)
    disp('bfs is not optimal')
end
[min_zc,ent_col]=min(zc)
%Step 6 Choose leaving variable if feasible
b = A(:,end)
pv_col = A(:,ent_col)
for i = 1:size(A,1)
    if pv_col(i) > 0
        ratio(i) = b(i)/pv_col(i)
    else
        ratio(i) = inf
    end
end
[min_ratio,lv_row] = min(ratio)

