

% Defining x and p

x = [1:10]';
p = [3, 5, 9, 4, 10, 8, 7, 9, 10];

% Calling perm_a on p and x
y1 = perm_a(p,x);

% Printing the output of the function perm_a(p,x)
T = table(y1)

% Defining the function perm_a(p, x)
function y = perm_a(p, x)
   
    y = x;
    
    % iterating over length of p
    for i = 1:length(p)
        % Matlab's switch operation
        y([i p(i)],:) = y([p(i) i],:);
    end  
end




