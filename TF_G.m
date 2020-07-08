%The output is a structure with H,F,G such that F(z) = H (zI - F)^-1 G + J

function G = TF_G(sys)


G.H = sqrtm(sys.Q);
G.F = sys.A;
G.G = eye(size(sys.A));
G.J = zeros(size(sys.A));