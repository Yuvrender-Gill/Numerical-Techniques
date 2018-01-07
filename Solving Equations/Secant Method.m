
% Roots of f(x) = x^2 - 2 using secant method

%% Code

% Defining n
n = 0:7;

% Defining Initial gusses
% Increaseing subscripts by 1 to use the MATLAB's subscript command to print values
x(1) = 1;
x(2) = 2;

% Defining the function
f = @(x) x*x - 2;

% Approximating error in the initail value 
xi(1) = x(1) - sqrt(2);
xi(2) = x(2) - sqrt(2);

% Printing the output from vector x and xi for first two elements

fprintf(' n              x(n) 	            x(n) - sqrt(2)\n');
fprintf(' =====================================================\n');
fprintf('%2d 	%1.15e	%1.15e \n', n(1), x(1), xi(1));
fprintf('%2d 	%1.15e	%1.15e \n', n(2), x(2), xi(2));

% Calculating rest of the approximate values of x for f(x) and printing the output

for i = 3:8
    % Using the secant method formula
    x(i) = (x(i-2)*f(x(i-1))  - (x(i-1)*f(x(i-2))))/(f(x(i-1)) - f(x(i-2)));
    % Storing the error in the approximate values 
    xi(i) = x(i) - sqrt(2);
    % Printing the output
    fprintf('%2d 	%1.15e	%1.15e \n', n(i), x(i), xi(i));
end




