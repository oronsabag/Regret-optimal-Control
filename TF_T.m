%This is anticausal T(z). The output is a structure with H,F,H such that T(z) = H (z^-1 - F)^-1 G

function T = TF_T(sys)

Klqr    = sys.Klqr;
P       = sys.P;

R_e = inv (sqrtm(( sys.R + sys.B'*P*sys.B )'));

T.H = R_e*sys.B'; 

T.F = (sys.A-sys.B*Klqr)';

T.G = (sys.A-sys.B*Klqr)'*sys.W;

% T.dim = size(T.F,1);


