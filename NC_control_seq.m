function u = NC_control_seq(w,NC_causal,NC_anti,T,dim)

xi      = zeros(3*dim.X,T);
alpha   = zeros(3*dim.X,T);

u = zeros(dim.X,T);

for t=1:T-1
    
    xi(:,T-t)     = NC_anti.F * xi(:,T-t+1) + NC_anti.G *w(:,T-t+1);

end

for t=1:T-1

    alpha(:,t+1)  = NC_causal.F*alpha(:,t)   + NC_causal.G*w(:,t);

end

for t=1:T
    
    u(:,t) =  - NC_anti.H*xi(:,t) - NC_causal.H*alpha(:,t) - NC_causal.J*w(:,t);
    
end