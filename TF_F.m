%The output is a structure with H,F,G such that F(z) = H (zI - F)^-1 G + J

function F = TF_F(sys)


F.H = sqrtm(sys.Q);
F.F = sys.A;
F.G = sys.B*inv(sqrtm(sys.R));
F.J = zeros(size(F.H,1), size(F.G,2));