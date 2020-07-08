function x = Sys_eval(x_0,sys,u,w,T)

 x = zeros(size(sys.A,1),T);

 x(:,1) = x_0;
 
for t=1:T

    x(:,t+1) = sys.A*x(:,t) + sys.B*u(:,t) + w(:,t);

end