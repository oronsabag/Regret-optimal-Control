function Kbar = TF_Kbar(T,g)

I_F = eye(size(T.F,1));

LyaK = Lyapunov_K(g,T);

if max(svd(LyaK.Z * LyaK.PI))>1
   disp('Inertia problem'); 
end

% PP = inv(I_F - LyaK.Z * LyaK.PI) * LyaK.Z;
% 
% K_p = T.F' * PP * T.G * inv(I_F + T.G' * PP * T.G);

K1_p = T.F' * inv(I_F - LyaK.Z * T.F * LyaK.PI* T.F') * LyaK.Z *T.G;

Fc = T.F' - K1_p*T.G';

Kbar.H = T.H * LyaK.PI * Fc ;

Kbar.F = Fc; 

Kbar.G = K1_p;

Kbar.J = T.H * LyaK.PI * K1_p;
