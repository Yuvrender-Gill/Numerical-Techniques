

% Defining x and p

x = [1:10]';
p = [3, 5, 9, 4, 10, 8, 7, 9, 10];

% Calling perm_b on p and perm_c on q1 and x
q1 = perm_b(p);
y = perm_c(q1,x);
% Printing the output of the function perm_c(q,x)
T = table(y)

% Defining the function perm_b(p)
function q = perm_b(p)
   
    q = 1:(length(p)+1);
    
    % iterating over length of p
    for i = 1:(length(p))
        % Tracking current value
        current_value = q(i);
        % Assigning new value to to current values' index
        q(i) = q(p(i));
        % Assigning current value to new value's index
        q(p(i)) = current_value;
    end  
end

% Defining the function perm_c(q, x)
function y = perm_c(q, x)
   
    y = x;
    
    % iterating over length of q
    for i = 1:(length(q))
        % Switching elements of y with elements of 
        y(i) = x(q(i));
    end  
end