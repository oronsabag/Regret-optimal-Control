function Kinf = Controller_inf(g,sys)

F = sys.A;
G1 = eye(size(sys.A));
G2 = sys.B*sqrtm(sys.R); %should it be inv(R^0.5)??

I_g = [eye(size(G2)) , zeros(size(G2,1),size(G1,2)) ; zeros(size(G2,1),size(G1,2))',-g^2*eye(size(G1))];

R_c = zeros(size(I_g));

[P,L,G] = dare(sys.A,[G2,G1],sys.Q,I_g);

R_c = I_g + [G2';G1']*P*[G2,G1];

K_c = inv(R_c)*[G2';G1']*P*F;

RGc = eye(size(G2)) + G2'*P*G2;

F2 = F - G2 * inv(RGc) * G2' * P * F;


Kinf.H =  - inv(RGc) * G2' * P * F;

Kinf.F = F2;

Kinf.G =  ( eye(size(P)) - G2 * inv(RGc) * G2' * P) * G1;

Kinf.J = - inv(RGc) * G2' * P * G1;