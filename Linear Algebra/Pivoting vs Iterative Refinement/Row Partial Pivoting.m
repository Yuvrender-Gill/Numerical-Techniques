%% Q2c: Code and Results
%% Part1: Observing Growth Factor with Row-Partial and Complete Pivoting

% Command to ignore the Singular Matrix warning
warning('off', 'MATLAB:nearlySingularMatrix');

% Defining dimensions of matrix 
n = 60;

% Performing given operations to obtain required A
A = ones(n,n);
A = A - triu(A);
A = eye(n) - A;
A = A + [ones(n-1,1); 0] * [zeros(1,n-1),1];

% Performing perations to obtain required matrix Q
Q = diag(ones(n-1,1),1);
Q(n,1) = 1;

% Performming LU factorization with row-partial pivoting
[L1, U1, P1] = lu(A);

ans = log2(U1(n,n));

% Performing LU factorization with complete pivoting 
[L2, U2] = lu(A*Q);
% Computing maximum element of U2
maxi = max(max(abs(U2)));

% Printing the results:
fprintf('|| U1(n,n) = %f | log2(U1(n,n)) = %f | Maximum elemet of U2 = %f || \n', U1(n,n), ans, maxi);

%% (A) Observation:
% * Thus we observe that ans = 59 = 60 -1 which is as predicted that is n - 1.
% * Secondly we observe that maxi = 2, which is a predicted.
% * Thus, we observe that the grwoth factor in the row-partial pivoting incresases exponentially with n, while complete pivoting prevents the the growth factor increase. 

%% Part2: Solving System of Equations for Error Analysis

% defining x and b
x = ones(n,1);
b = A *x;

% Solving the system by LU factorization obtained by partial-row pivoting
y_row = L1\b;
x1 = U1\y_row;
x1_norm = norm(x1, 1);
% Difference of x and x1
diff_row = [norm(x-x1,inf)];

% Solving the system by LU factorization obtained by complete pivoting

y_complete = L2 \ b;
z = U2 \ y_complete;
x2 = Q * z;
x2_norm = norm(x2,1);
diff_complete = [norm(x-x2,inf)];

% Printing the results.
formatSpec = 'Value of 1-norm of x1: %d \nValue of 1-norm of x2: %d \nError in Row Partial Pivoting: %d \nError in Complete Pivoting: %d.';
fprintf(formatSpec,x1_norm, x2_norm, diff_row, diff_complete);


%% (B) Observation:
% # Row partial pivoting yields an error of approximately 1 while the complete pivoting produced the error of 0 (considering MATLAB's maximum precision) that is complete pivoting is much better than the row pivoting.







