function D_para = TF_D(sys)


Klqr  = sys.Klqr;
P    = sys.P;

R_e = sqrtm(sys.R + sys.B'*P*sys.B );

D_para.H = R_e*Klqr;

D_para.F = sys.A;

D_para.G = sys.B*inv(sqrtm(sys.R));

D_para.J = R_e*sqrtm(sys.R);

