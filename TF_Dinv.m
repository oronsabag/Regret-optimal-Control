function Dinv_para = TF_Dinv(sys)


Klqr  = sys.Klqr;
P    = sys.P;

R_e = inv (sqrtm(( sys.R + sys.B'*P*sys.B )'));

Dinv_para.H =  - sqrtm(sys.R)*Klqr;

Dinv_para.F = sys.A - sys.B*Klqr;

Dinv_para.G = sys.B*R_e;

Dinv_para.J = sqrtm(sys.R)*R_e;

% Dinv_para.dim = size(Dinv_para.F,1);

