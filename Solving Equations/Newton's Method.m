
% Newton's method to solve f(x) = x^2 - 2.

%% Code:

% Defining n
n = 0:5;

% Defining x (Initial guessss)
x = 1;

% Defining the thefunction under consideration and its derivative
f = @(x) x^2 - 2;
df = @(x) 2*x;

fprintf(' n              x(n) 	            x(n) - sqrt(2)\n');
fprintf(' =====================================================\n');

for i = n
        % Approximating better value of x with Newton's Method.
	x_k = x-(f(x))/(df(x));
        % Error in approximated value 
	error = x - sqrt(2);
        % Printing the results
	fprintf('%2d 	%1.15e  	%1.15e \n', n(i+1), x, error);
        % Assigning our guess to better guess. 
	x = x_k;      
end




