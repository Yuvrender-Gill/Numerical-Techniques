

% defining p

p = [3, 5, 9, 4, 10, 8, 7, 9, 10];

% Calling perm_b on p
q1 = perm_b(p);

% Printing the output of the function perm_b(p)
T = table(q1')

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