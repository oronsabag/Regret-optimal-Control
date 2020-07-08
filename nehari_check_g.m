function Fail = Nehari_check_g(g,T,LyaK)

Fail=0;

I_g = [eye(size(T.G,2)) , zeros(size(T.G,2),size(T.H,1)) ; zeros(size(T.H,1),size(T.G,2)),-g^2*eye(size(T.H,1)) + T.H*LyaK.PI*T.H'];

%Riccati syntax:
%   DARE(A,B,Q,R,S,E) solves
%   E'XE = A'XA - (A'XB + S)(B'XB + R)^-1(A'XB + S)' + Q

%OUR riccati:
% P = F'PF - KpReKp'
% where
% Re = I_g + BPB'
% Kp = F'P[ - G, F*LyaK.Pi*H' ]*inv(Re);

%

A_Ric = T.F;
B_Ric = [-T.G , T.F * LyaK.PI * T.H'];
Q_Ric = zeros(size(A_Ric));
R_Ric = I_g;
S_Ric = [zeros(size(T.F,1),size(T.G,2)),T.H'];


[P,L,G,REPORT] = dare(A_Ric,B_Ric,Q_Ric,R_Ric,S_Ric);

if REPORT<0
    Fail=1;
    return
else
    Re = I_g + B_Ric'*P*B_Ric;
    Kp = T.F'*P*B_Ric*inv(Re);
end

% L = eig( F' -  Kp*B');

if max(L)>=1 %L has eigenvalues smaller than 1
    Fail=1;
end

if min(eig(P))<0 || ~issymmetric(P) %check if P>=0
    Fail=1;
end

if sum (eig(Re)>0) ~= sum (eig(Re)<0) %  check even inertia of Re
    Fail = 1;
end

% if sum (eig(R_c)>0.01) ~= dim.u  || sum (eig(R_c)<-0.01) ~= dim.X  %  check inertia of R_c vs. eig(R_c)
%     Fail = 1;
% end



