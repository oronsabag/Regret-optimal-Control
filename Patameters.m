% The outputs is the system and its dimensions

function [sys,dim] = Patameters()

I = 1; %Choose which matrices take part in A. 1 is both, 2 is stable and 3 is antistable

%choose stable matrix 
sys.As  = 0.9*eye(1);
   sys.As = rand_stable(3); %%This function generates random stable matrix 
dim.As  = size(sys.As,1);

%choose antistable matrix 
sys.Aas = 1.3*eye(1);
%  sys.Aas = rand_antistable(1);
dim.Aas = size(sys.Aas,1);

if I==1
    sys.A   = blkdiag(sys.As,sys.Aas);     % We have assumption on EigenValues
    sys.lambda  = blkdiag(sys.As,inv(sys.Aas));
    dim.X   = size(sys.A,1);
    sys.M   = [zeros(dim.As,dim.X);zeros(dim.Aas,dim.As),-inv(sys.Aas)];
elseif I==2 
    sys.A   = sys.As;
    sys.Aas = 0;
    sys.lambda  = sys.As;
    sys.M=zeros(size(sys.As));
else
    sys.As = 0;
    dim.As = 0;
    sys.A   = sys.Aas;     % We have assumption on EigenValues
    sys.lambda  = inv(sys.Aas);
    sys.M   = -inv(sys.Aas);
end
sys.dimX   = size(sys.A,1);

%Choose control matrix 

sys.B = eye(sys.dimX); 
%  sys.B = ones(dim.X,1); 
sys.dimU = size(sys.B,2);

% sys.B = rand(dim.X,dim.u);

sys.Q = eye(sys.dimX);              % should be psd
sys.R = eye(sys.dimU);              % should be pd 


[sys.Klqr,sys.P,eig_AK] = dlqr(sys.A,sys.B,sys.Q,sys.R);

if max(eig_AK)>1
    disp('Riccati solution is not stabilizing');
end

sys.W             = Lyapunov_W(sys);


