%The output is a structure with H,F,G,J such that S(z) = H (z^{-1}I - F)^-1 G + J

function S = TF_S(sys)


Klqr    = sys.Klqr;
P       = sys.P;

R_e = inv (sqrtm(( sys.R + sys.B'*P*sys.B )'));

S.H = R_e*sys.B'*sys.W*sys.A;

S.F = sys.A;

S.G = eye(size(S.F));

S.J = R_e*sys.B'*sys.W;

% S.dim = size(S.F,1); %dimenstion of the internal state