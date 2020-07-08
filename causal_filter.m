function u = causal_filter(w,Para,T,dim)

alpha = zeros(Para.dim,T);


u = zeros(dim.u,T);

for t=1:T-1
    
    alpha(:,t+1)  = Para.F*alpha(:,t) + Para.G*w(:,t);
    
end

for t=1:T
    
    u(:,t) =  Para.H*alpha(:,t) + Para.J*w(:,t);
    
end