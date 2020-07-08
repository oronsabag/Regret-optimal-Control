function [f_vec,maxSV] = plot_Frobenius(f_vec,F_freq_sampled,color)

for i=1:length(f_vec)
    
    Frob(i) = sqrt (trace (abs( F_freq_sampled(:,:,i)' * F_freq_sampled(:,:,i)  )) );
    
end

disp(sum(Frob));

if color==1
    plot(f_vec,Frob,'b','DisplayName','H_2');
elseif color==2
    plot(f_vec,Frob,'r','DisplayName','Non-causal');
elseif color==3
    plot(f_vec,Frob,'g','DisplayName','Regret-optimal');
elseif color==4
    plot(f_vec,Frob,'k','DisplayName','ORON');
    title('Frobenius norm')
end