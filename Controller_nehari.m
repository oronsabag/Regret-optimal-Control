function Kbar = Controller_nehari(g,T,LyaK)

I_g = [eye(size(T.G,2)) , zeros(size(T.G,2),size(T.H,1)) ; zeros(size(T.H,1),size(T.G,2)),-g^2*eye(size(T.H,1)) + T.H*LyaK.PI*T.H'];


A = T.F; 
B_Temp = [-T.G , T.F * LyaK.PI * T.H'];

[P,L,G,REPORT] = dare(T.F,B_Temp,zeros(size(A)),I_g,T.H');


K_p = T.F' * P * T.G * inv(eye(size(T.G,2)) + T.G' * P * T.G);

Kbar.H = [ - T.H * LyaK.PI * K_p * T.G'  , T.H * LyaK.PI * T.F'] ;

Kbar.F = [T.F' - K_p * T.G', zeros(size(T.F)); -K_p*T.G', T.F']; 

Kbar.G = [K_p;K_p];

Kbar.J = T.H * LyaK.PI * K_p;

Kbar.dim = size(Kbar.F,1);
