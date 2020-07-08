function LyaK = Lyapunov_K(g,T_para)

% dlyap(A,B,C); solves AXB-X+C=0;

%F'ZF - Z + g^-2H* H = 0;

A_Z = T_para.F';
B_Z = T_para.F;
C_Z = g^(-2)*(T_para.H)'*(T_para.H);

LyaK.Z = dlyap(A_Z,B_Z,C_Z);

% F PI F* - pi + G*G = 0

A_PI = T_para.F;
B_PI = (T_para.F)';
C_PI = (T_para.G)*(T_para.G)';

LyaK.PI = dlyap(A_PI,B_PI,C_PI);