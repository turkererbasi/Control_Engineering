clc

% Define state matrices
A = [0 1; 2 -1];
B = [1; 0];
C = [1 0];
D = 0;

% Create state space object
sys = ss(A, B, C, D);

% Check open loop eigenvalues
E = eig(A); % E = [1; -2]
            % Unstable since 1 is positive.

% Desired (stable) closed loop eigen values
P = [-2 -1];

% Solve for K using pole placement method
K = place(A, B, P); % Gain values K = [2 1]

% Check for closed loop eigenvalues
Acl = A - B*K;
Ecl = eig(Acl);

% Create closed loop system
syscl = ss(Acl, B, C, D);

% Check step response for both
step(sys);
step(syscl);

% Solve for Kr
Kdc = dcgain(syscl); % Kdc = 0.5
Kr = 1/Kdc; % Kr = 2

% Create scaled input closed loop system
syscl_scaled = ss(Acl, B*Kr, C, D);
step(syscl_scaled);