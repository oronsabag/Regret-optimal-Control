function Operator = Construct_All_Operators(Samp)

K  = zeros(size(Samp.F,2),size(Samp.G,2),size(Samp.G,3));

for i=1:size(Samp.G,3)
    
    K_regret =  - Samp.Dinv(:,:,i)*(Samp.Kbar(:,:,i) + Samp.S(:,:,i)); 
          
    K_NC =  - Samp.Dinv(:,:,i)*(Samp.T(:,:,i) + Samp.S(:,:,i));
    
    Upper_regret = Samp.F(:,:,i)*K_regret + Samp.G(:,:,i);

    Upper_NC = Samp.F(:,:,i)*K_NC + Samp.G(:,:,i);
    
    Upper_inf = Samp.F(:,:,i)*Samp.Kinf(:,:,i) + Samp.G(:,:,i);
    
    Upper_H2 = Samp.F(:,:,i)*Samp.KH2(:,:,i) + Samp.G(:,:,i);
    
    Operator.regret(:,:,i) = [Upper_regret;K_regret];
    
    Operator.NC(:,:,i) = [Upper_NC;K_NC];
    
    Operator.inf(:,:,i) = [Upper_inf;Samp.Kinf(:,:,i)];

    Operator.H2(:,:,i) = [Upper_H2;Samp.KH2(:,:,i)];


end


% 
% K_NC        = - Samp.Dinv.*( Samp.T + Samp.S);
% 
% Operator.regret = Construct_Operator(K_regret,Samp);
% Operator.NC     = Construct_Operator(K_NC,Samp);
% Operator.inf	= Construct_Operator(Samp.Kinf,Samp);
