function [f_vec,maxSV] = plot_maxSV_log(f_vec,F_freq_sampled,color)

for i=1:length(f_vec)
    
    maxSV(i) = max(svd(F_freq_sampled(:,:,i)));
    
end

disp(max(maxSV(:)));
if color==1
    semilogy(f_vec,maxSV,'DisplayName','H_2','color','b');
elseif color==2
    semilogy(f_vec,maxSV,'r','DisplayName','Non-causal');
elseif color==3
    semilogy(f_vec,maxSV,'g','DisplayName','Regret-optimal');
elseif color==4
    semilogy(f_vec,maxSV,'y','DisplayName','LQR');
    title('Operator norm (max. Singular Value)')
    legend()
end

