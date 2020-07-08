% The outputs is the system and its dimensions

function sys = Patameters()

sys.A  = 0.9*eye(1);
% sys.A  = rand_stable(3); %This function generates random stable matrix 
sys.dimX = size(sys.A,1);


sys.dimU = size(sys.A,1); %Choose the size of the control vector
sys.B = eye(sys.dimU); 
% sys.B = ones(1,size(sys.A,1)); 
% sys.B = rand(size(sys.A,1),sys.dimU);

sys.Q = eye(size(sys.A,1));              % should be psd
sys.R = eye(sys.dimU);              % should be pd 

[sys.Klqr,sys.P,eig_AK] = dlqr(sys.A,sys.B,sys.Q,sys.R);

if max(eig_AK)>1
    disp('Riccati solution is not stabilizing');
end

sys.W             = Lyapunov_W(sys);


