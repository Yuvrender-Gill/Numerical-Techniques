
% * Objective: To find the volume with Gas Law and van der Waals equation for given pressure and temprature.
% * Gas law: pv = RT
% * van der Waals: (p + a/v^2)(v - b) = RT

% Defining the constants
R = 0.082054; 
b = 0.04267;
a = 3.592;
T = 300;

% Writing van der Walls equation 
van_eqn = @(v,p) (p + a/v^2) * (v - b) - R * T;

% Formating output 
fprintf('Pressure  ||        Ideal Gas Law      ||      van der Waals\n');
fprintf('=================================================================\n');

% Calculating the volume for three pressures and printing the results
for i = 1:3
    % Calculating the pressure 
    p = 10^(i-1);
    % Calculating volume by gas law
    v_GasLaw = R * T/p;
    % defining a temprary function to solve with fzero and given pressure
    temp = @(v) van_eqn(v, p);
    % Calculating volume by van der Waals equation using v_GasLaw as initial guess.  
    v_van_der_Waals = fzero(temp, v_GasLaw);
    % Printing the output 
    fprintf('%4.0d      ||    %20.16f   ||   %20.16f  \n', p, v_GasLaw, v_van_der_Waals);
end

fprintf('=================================================================\n');