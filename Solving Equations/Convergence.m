%% Q2b: Code and Results
% Analysis of the convergence and convergence rate for f(x) = 3x^2 -3x + 2's given fixed point iteration schemes.

%% Code:

% Defining f
f = @(x) (3*(x^2)) - (3*x) + 2;

% Defining fixed point iteration schemes g1, g2, g3, g4
g1 = @(x) ((x^2) + 2)/3;
g2 = @(x) sqrt(3*x -2);
g3 = @(x) 3 - (2/x);
g4 = @(x) (x^2 - 2)/(2*x -3);

% Setting the value of root
root = 2;

% Setting the initial guess and getting absolute error
x = 1.94;
absolute_error = abs(x-root);

% Setting the print format
fprintf('Results for g4(x) \n \n');
fprintf('   i 	          x 	           Absolute Error 	   Error Ratio \n');
fprintf('===========================================================================\n');
fprintf('|%3d | %20.12e | %20.12e | %20.12e |\n', 0, x, absolute_error, 1);

% Performing fixed point iteration and printing value of x, Absolute error and error ratio or g1, g2, g3, g4
for i = 1:10
        x = g4(x);
	new_error = abs(x-root);
	error_ratio = new_error/absolute_error;
        absolute_error = new_error;
	fprintf('|%3d | %20.12e | %20.12e | %20.12e |\n', i, x, absolute_error, error_ratio);
end


