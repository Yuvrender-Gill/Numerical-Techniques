%% Q1c: Code and Results 
%% Variables

% Command to ignore the Singular Matrix warning
warning('off', 'MATLAB:nearlySingularMatrix');

% Defining k and double scaling it in order to reduce any error by multiplication operation. 
k = 2;
% defining b
b = [1 1];
% defining x
x = [1 -1];

%% Defining Collections

% A vector to collect values of gamma 
Gamma = [];
% A vector to collect the first element of error = x - x_hat
Error1 = [];
% A vector to collect the second element of error = x - x_hat
Error2 = [];

x_app1 = [];
x_app2 = [];

x_abs1 = [];
x_abs2 = [];

x_abs1Norm = [];
x_abs2Norm = [];

%% Calculations
% * Iterative refinement with LU factorization. 
while k <= 20
     
    % Defining gamma
    gamma = 10^(-k);
    % Concatinating Collections of values of gamma
    Gamma = [Gamma; abs(gamma)];
    
    A = [gamma (gamma -1); 2 1];
    % Defining L1 
    L1 = [1 0; 2/gamma 1];
    % Defining U1.
    U1 = [gamma (gamma -1); 0 ((2/gamma) -1)];
    % Calculating y
    y = L1\b';
    % Calculating solution of the system 'x_hat'
    x_hat = U1\y;
   
    
    % Calculating the resudial r, z, e, x_approx for one iterative refinement
    r = b' - (A*x_hat);
    z = L1\r;
    e = U1\z;
    x_approx = x_hat + e;
    
    % Caculating error in calculated value of x compared with x_hat and x_approx
    absErr = x' - x_hat;
    absErr2 = x' - x_approx;
   
    
    % Concatinating Collections of values of first and second elements of absErr and absErr2
    Error1 = [Error1, absErr(1)];
    Error2 = [Error2, absErr(2)];
    x_app1 = [x_app1, x_approx(1)];
    x_app2 = [x_app2, x_approx(2)];
    x_abs1 = [x_abs1, absErr2(1)];
    x_abs2 = [x_abs2, absErr2(2)];
    

    
    % Incrementing k with 2 as k is scaled doubled
    k = k + 2;
end

% Transposing Error1 and Error2 vectors for output formating.
Error1 = Error1';
Error2 = Error2';
x_app1 = x_app1';
x_app2 = x_app2';
x_abs1 = x_abs1';
x_abs2 = x_abs2';

%% Results 

% Printing the table of values of Gamma, Error1, and Error2
T = table(Gamma, Error1, Error2, x_app1, x_app2, x_abs1, x_abs2)

%% Observation
% # The approximated x with iterative refinement is same as the give x (refering to x_app1 and x_app2 in the results table).
% # The error with inaccurate LU factorization insreases as gamma decreases while the error in better approximated value of x (refer to x_abs1 and x_abs2 for respective error elements) is zero.
