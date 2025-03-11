clc; clear; close all;

%% High Voltage DC (HVDC) Transmission System Simulation
% This script simulates an HVDC system, including rectification, DC transmission, and inversion.

%% System Parameters
V_ac = 230;  % AC voltage (V)
I_ac = 50;   % AC current (A)
R_load = 10; % Load resistance (ohms)
converter_efficiency = 0.95; % Converter efficiency
transmission_loss_factor = 0.02; % 2% loss in transmission

%% AC to DC Rectification
P_ac = V_ac * I_ac; % AC Power (W)
P_dc = P_ac * converter_efficiency; % DC Power after rectification
V_dc = sqrt(2) * V_ac; % Approximate DC voltage
I_dc = P_dc / V_dc; % DC current

%% HVDC Transmission
transmission_loss = P_dc * transmission_loss_factor;
P_transmitted = P_dc - transmission_loss;

%% DC to AC Inversion
P_ac_out = P_transmitted * converter_efficiency; % Power after inversion
V_ac_out = V_ac; % Restoring AC voltage at receiving end
I_ac_out = P_ac_out / V_ac_out; % AC current at receiving end

%% Visualization
figure;
subplot(3,1,1);
bar([P_ac, P_dc, P_transmitted, P_ac_out]);
set(gca, 'xticklabel', {'AC Input', 'DC Power', 'Transmitted Power', 'AC Output'});
title('Power Flow in HVDC System');
ylabel('Power (W)'); grid on;

subplot(3,1,2);
bar([V_ac, V_dc, V_ac_out]);
set(gca, 'xticklabel', {'AC Voltage In', 'DC Voltage', 'AC Voltage Out'});
title('Voltage Comparison');
ylabel('Voltage (V)'); grid on;

subplot(3,1,3);
bar([I_ac, I_dc, I_ac_out]);
set(gca, 'xticklabel', {'AC Current In', 'DC Current', 'AC Current Out'});
title('Current Comparison');
ylabel('Current (A)'); grid on;

%% Display Results
disp(['Input AC Power: ', num2str(P_ac), ' W']);
disp(['Rectified DC Power: ', num2str(P_dc), ' W']);
disp(['Transmitted DC Power: ', num2str(P_transmitted), ' W']);
disp(['Output AC Power: ', num2str(P_ac_out), ' W']);
disp(['Transmission Loss: ', num2str(transmission_loss), ' W']);
disp(['System Efficiency: ', num2str((P_ac_out/P_ac) * 100), ' %']);
