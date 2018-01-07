%% Q1a: Code and Results 
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

%% Calculations
while k <= 20
    
    % Defining gamma
    gamma = 10^(-k);
    % Concatinating Collections of values of gamma
    Gamma = [Gamma; abs(gamma)];
    % Defining L1 
    L1 = [1 0; 2/gamma 1];
    % Defining U1
    U1 = [gamma (gamma -1); 0 ((2/gamma) -1)];
    % Calculating y
    y = L1\b';
    % Calculating solution of the system 'x_hat'
    x_hat = U1\y;
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
T = table(Gamma, Error1, Error2)

%% Observation
% * The accuracy of the solution decreases as the value of magnitude gamma decreases. It is evident from the above table that as the gamma decreases the first element of the error = x - $$\hat{x}$ increases. Thus, the overall error of calculated solution increases.  

