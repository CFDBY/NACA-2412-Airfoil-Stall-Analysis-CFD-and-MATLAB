% --- INPUTS ---
rho = 1.225;             % Air density (kg/m^3)
V = 60;                  % Freestream velocity (m/s)
AoA_deg = [0 5 10 12 15 18 20];   % Angle of Attack (degrees)
AoA_rad = deg2rad(AoA_deg);       % Convert to radians

chord = 0.2;             % Chord length (m)
span = 1;                % Spanwise depth (m)
S = chord * span;        % Reference area (m²)

% --- LIFT COEFFICIENT MODEL (Theoretical approximation) ---
% Thin airfoil theory: CL ≈ 2π * alpha (in radians)
CL_theoretical = 2 * pi * AoA_rad;

% --- DRAG COEFFICIENT MODEL (Parabolic approximation) ---
% Drag polar: CD = CD0 + k * CL^2
CD0 = 0.01;              % Parasite drag
k = 0.02;                % Induced drag factor
CD_theoretical = CD0 + k * CL_theoretical.^2;

% --- AERODYNAMIC FORCES ---
L = 0.5 * rho * V^2 * S .* CL_theoretical;   % Lift force (N)
D = 0.5 * rho * V^2 * S .* CD_theoretical;   % Drag force (N)

% --- PLOT RESULTS ---
figure;
subplot(2,1,1);
plot(AoA_deg, CL_theoretical, '-o', 'LineWidth', 2);
xlabel('Angle of Attack (°)');
ylabel('C_L');
title('Lift Coefficient vs Angle of Attack');
grid on;

subplot(2,1,2);
plot(AoA_deg, CD_theoretical, '-o', 'LineWidth', 2);
xlabel('Angle of Attack (°)');
ylabel('C_D');
title('Drag Coefficient vs Angle of Attack');
grid on;
