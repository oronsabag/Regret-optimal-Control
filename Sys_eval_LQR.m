function [x, uLQR] = Sys_eval_LQR(x_0,sys,Klqr,w,T)

 x = zeros(size(sys.A,1),T);

 x(:,1) = x_0;
 
for t=1:T
    
    x(:,t+1) = sys.A*x(:,t) - sys.B*Klqr*x(:,t) + w(:,t);

    uLQR(:,t) = Klqr*x(:,t);
end
