%The output is a structure with both anticausal and causal parts

function [NC_causal, NC_anti] = TF_NonCausal(sys,TFs,TFt)


Klqr    = sys.Klqr;
P       = sys.P;

R_e = inv (sqrtm(( sys.R + sys.B'*P*sys.B )'));

z_A = zeros(size(sys.A));


% Reminder: dlyap(A,B,C); solves C - X+ AXB = 0;

L_A = sys.A-sys.B*Klqr;
L_B = TFt.F;
L_C =sys.B*R_e* TFt.H;
U = dlyap(L_A,L_B,L_C);

% The causal part

NC_causal.H = sqrtm(sys.R)*[ -Klqr, R_e*TFs.H];

NC_causal.F = [sys.A-sys.B*Klqr, sys.B*R_e*TFs.H; z_A, TFs.F];

NC_causal.G = [ (sys.A-sys.B*Klqr)* U*TFt.G + sys.B*R_e*TFs.J ; TFs.G];

NC_causal.J =  - sqrtm(sys.R)*Klqr*U*TFt.G + sqrtm(sys.R)*R_e*TFs.J;

% The anticausal part

NC_anti.H = sqrtm(sys.R)*R_e* TFt.H - sqrtm(sys.R)*Klqr*U*TFt.F;

NC_anti.F = TFt.F;

NC_anti.G = TFt.G;
