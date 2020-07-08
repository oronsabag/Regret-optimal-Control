function Fail = Inf_check_g(g,sys)

Fail=0;

F = sys.A;
G1 = eye(size(sys.A));
G2 = sys.B*sqrtm(sys.R);

I_g = [eye(size(G2)) , zeros(size(G2,1),size(G1,2)) ; zeros(size(G2,1),size(G1,2))',-g^2*eye(size(G1))];

R_c = zeros(size(I_g));
%Riccati preparation:
% E'XE = A'XA - (A'XB + S) (B'XB + R)^-1  (A'XB + S)' + Q
%OUR riccati:
% P = F'PF + L'L - K_c' R_c K_c
% Kc' R_c K_c =


[P,L,G,REPORT] = dare(sys.A,[G2,G1],sys.Q,I_g);

if REPORT<0
    Fail=1;
    return
else
    R_c = I_g + [G2';G1']*P*[G2,G1];
    K_c = inv(R_c)*[G2';G1']*P*F;
end

% L = eig( F -  [G2,G1]*K_c);

if max(L)>=1 %L has eigenvalues smaller than 1
    Fail=1;
end

if min(eig(P))<0 || ~issymmetric(P) %check if P>=0
    Fail=1;
end

if sum (eig(R_c)>0) ~= sys.dimU  || sum (eig(R_c)<0) ~= sys.dimX  %  check inertia of R_c vs. eig(R_c)
    Fail = 1;
end

if sum (eig(R_c)>0.00001) ~= sys.dimU  || sum (eig(R_c)<-0.01) ~= sys.dimX  %  check inertia of R_c vs. eig(R_c)
    Fail = 1;
end



