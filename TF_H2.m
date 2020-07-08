%Sahin: The input is sys that includes all you need. That is, sys.A is A,
%sys.B is B and similarly for Q and R

function H2 = TF_H2(sys)

F = sys.A;
L = sqrtm(sys.Q);
G1 = eye(size(sys.A,1));
G2 = sys.B* inv(sqrtm(sys.Q));

% Riccati: 
% 
% P = F'*P*F + eye(size(sys.A,1)) - F'*P*G2*inv(Rc)*G2'*P*F;
% 
% Rc = sys.Q + G2'*P*G2;

[P,L,G] = dare(F,G2, eye(size(sys.A,1)),sys.Q);

Rc = sys.Q + G2'*P*G2;
Kc = inv(Rc)*G2'*P*F;
Fc = F - G2*Kc;

H2.H = -Kc;
H2.F = Fc;
H2.G = (eye(size(sys.A,1)) - G2*inv(Rc)*G2'*P)*G1;
H2.J = -inv(Rc)*G2'*P*G1;