function [f_vec,maxSV] = plot_color(f_vec,maxSV,color)


if color==1
    plot(f_vec,maxSV,'DisplayName','H_2','color','b');
elseif color==2
    plot(f_vec,maxSV,'r','DisplayName','Non-causal');
elseif color==3
    plot(f_vec,maxSV,'g','DisplayName','Regret-optimal');
elseif color==4
   plot(f_vec,maxSV,'k','DisplayName','H_\infty');
elseif color==5
    plot(f_vec,maxSV,'y','DisplayName','LQR');
 
    title('Operator norm (max. Singular Value)')
%     legend()
end