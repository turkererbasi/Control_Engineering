% MATLAB contains several functions which can be used for system analysis. 
% For example, functions to compute the rank of a matrix, eigenvalue of a 
% matrix, controllability and observability matrix are available

matrixA=[1 2; 3 4]; % System matrix.
matrixB=[5; 6]; % Input matrix.
matrixC=[7, 8]; % Output matrix.

% Define a state-space description of the system.
sys ss=ss(matrixA,matrixB,matrixC,zeros(size(matrixC,1),size(matrixB,2)));

rank(matrixA); % Compute the rank of matrixA.
eig(matrixA); % Compute the eigenvalues of matrixA.
ctrb(matrixA,matrixB); % Compute the controlability matrix of matrixA and matrixB.
ctrb(sys ss); % Compute the controlability matrix of system sys ss.
obsv(matrixA,matrixC); % Compute the observability matrix of matrixA and matrixC.
obsv(sys ss); % Compute the observability matrix of system sys ss.
margin(sys ss(1,1)); % Compute the stability margin of a SISO system sys ss.
marginStruct=allmargin(sys ss); % Compute all stability margin of a system sys ss. 
% Margins are returned values in a sructure. 

% Therefore, the stability, the 
% controllability and the observability properties of a system can be checked
% easily. The basic elements of a system also  can be created in MATLAB

P=tf(K,1); % Proportional element. K is the gain.
sys I=tf(1,[Ti 0]); % Integrator element. Ti is the integral time constant.
sys firstOrder=tf([0 A],[T,1]); % First order system. 
% A is the amplitude while T is the time constant
sys secondOrder=tf([0 0 A],[T*T,2*T*damp,1]); % Second order system. 
% A is the amplitude, T is the time constant, while damp is the damping coefficient.


% State Space representation to Trasnfer Function nom and denom
[Ys, Us] = ss2tf(A, B, C, D); 

Ws = tf(Ys,Us); % Creating the Transfer function form the nom and denom

nyquist(Ws) % Plots the Nyquist diagram 

bode(Ws) % Plots the Bode diagram

impulse(Ws) % Plots the input response
