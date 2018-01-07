%% Q1b: Code and Results 
%% Variables

% Command to ignore the Singular Matrix warning
warning('off', 'MATLAB:nearlySingularMatrix');

% Defining k and double scaling it in order to reduce any error by multiplication operation. 
k = 2;
% defining b
b = [1 1];
% defining x
x = [1 -1];
% Defining matrix P2 as given in problem
P2 = [0 1; 1 0];

%% Defining Collections

% A vector to collect values of gamma 
Gamma = [];
% A vector to collect the first element of error = x - x_hat
Error1 = [];
% A vector to collect the second element of error = x - x_hat
Error2 = [];

%% Calculations
while k <= 20
    % Defining gamma
    gamma = 10^(-k);
    % Concatinating Collections of values of gamma
    Gamma = [Gamma; abs(gamma)];
    % Caclucating b approx
    b_approx = P2*b';
    % Defining L1 
    L2 = [1 0; (gamma/2) 1];
    % Defining U1
    U2 = [2 1; 0 ((gamma/2) -1)];
    % Calculating y
    y = L2\b_approx;
    % Calculating solution of the system 'x_hat'
    x_hat = U2\y;
    % Caculating error in calculated value of x
    absErr = x' - x_hat;
    % Concatinating Collections of values of first and second elements of absErr
    Error1 = [Error1, absErr(1)];
    Error2 = [Error2, absErr(2)];
    % Incrementing k with 2 as k is scaled doubled 
    k = k + 2;
end

% Transposing Error1 and Error2 vectors for output formating.
Error1 = Error1';
Error2 = Error2';

%% Results 

% Printing the table of values of Gamma, Error1, and Error2
format long
T = table(Gamma, Error1, Error2)

%% Observations
% # The Error =  x - $$\hat{x}$ is zero for all the values of gamma.
%    This shows that pivoting anilates the error even when the gamma is small.
%    This result is consistent with the theoritical prediction given in the question
%    for the nature of gamma and error while calculating the solution with pivoting. 
% # The error in the first part (refer to Q1A observation and results section) increased
%    with decreasing values of gamma, while pivoting is independent of the gamma.  

