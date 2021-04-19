function [Out_X,RMSE,MAE] = LP2(M,M_Omega,Omega_array,rak,maxiter)

[r,c] = size(M_Omega);
U = randn(r,rak);
V = randn(rak,c);
RMSE = zeros(1, maxiter);
MAE = zeros(1, maxiter);
for iter = 1 : maxiter
    for j = 1:c
        row = find(Omega_array(:,j) == 1);
        U_I =  U(row,:);
        b_I = M_Omega(row,j);
        V(:,j) = pinv(U_I)* b_I;
    end
    for i = 1 : r
        col = find(Omega_array(i,:) == 1);
        V_I = V(:,col);
        b_I = M_Omega(i,col);
        U(i,:) = b_I * pinv(V_I);
    end
    X = U*V;
    RMSE(1,iter) = norm(M- X,'fro')/norm(M,'fro'); 
    MAE(1,iter) = norm(X - M_Omega)/nnz(Omega_array);
end
    Out_X = X;
end