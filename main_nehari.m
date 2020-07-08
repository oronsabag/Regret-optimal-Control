clearvars
close all
clc

sys                     = Patameters();

Trans_func              =  Transfer_functions (sys);

freq_vec                = linspace(0,2*pi,1000);

Sampled_Trans_func      = Sample_All_Trans_func(freq_vec,Trans_func);

Sampled_Operators       = Construct_All_Operators(Sampled_Trans_func);

regret_maxSV    = maxSV_vec(Sampled_Operators.regret,freq_vec);
NC_maxSV        = maxSV_vec(Sampled_Operators.NC,freq_vec);
Hinf_maxSV      = maxSV_vec(Sampled_Operators.inf,freq_vec);
H2_maxSV        = maxSV_vec(Sampled_Operators.H2,freq_vec);

% LQR_maxSV       = maxSV_vec(Operator_LQR,f_vec);
% LQR_Frob    = Frobenius_vec(Operator_LQR,f_vec);


disp('==================');
disp(['max_dis_regret = ',num2str(max(regret_maxSV - NC_maxSV))]);
 disp(['max_dis_H2 = ',num2str(max(H2_maxSV - NC_maxSV))]);
disp(['max_dis_Hinf = ',num2str(max(Hinf_maxSV - NC_maxSV))]);

disp('==================');
disp(['Peak_ON_regret = ',num2str(max(regret_maxSV))]);
disp(['Peak_ON_H2 = ',num2str(max(H2_maxSV))]);
disp(['Peak_ON_Hinf = ',num2str(max(Hinf_maxSV))]);

regret_Frob = Frobenius_vec(Sampled_Operators.regret,freq_vec);
NC_Frob     = Frobenius_vec(Sampled_Operators.NC,freq_vec);
Hinf_Frob   = Frobenius_vec(Sampled_Operators.inf,freq_vec);
H2_Frob     = Frobenius_vec(Sampled_Operators.H2,freq_vec);



disp('==================');
disp(['Frob_regret = ',num2str(sum(regret_Frob))]);
disp(['Frob_NC = ',num2str(sum(NC_Frob))]);
disp(['Frob_Hinf = ',num2str(sum(Hinf_Frob))]);
% disp(['Frob_LQR = ',num2str(sum(LQR_Frob))]);
disp(['Frob_H2 = ',num2str(sum(H2_Frob))]);


figure
subplot(1,2,1)
hold on
plot_color(freq_vec,H2_maxSV,1); %blue
plot_color(freq_vec,NC_maxSV,2); % red
plot_color(freq_vec,regret_maxSV,3); %green
plot_color(freq_vec,Hinf_maxSV,4); %black
% plot_color(f_vec,LQR_maxSV,5); 

subplot(1,2,2)
hold on
plot_color(freq_vec,H2_Frob,1);
plot_color(freq_vec,NC_Frob,2);
plot_color(freq_vec,regret_Frob,3);
plot_color(freq_vec,Hinf_Frob,4);


% figure
% subplot(1,2,1)
%  set(gca,'yscale','log')
% plot_maxSV_log(f_vec,Operator_ORON,1); % blue
% hold on
% plot_maxSV_log(f_vec,Operator_Noncausal,2); % red
% plot_maxSV_log(f_vec,Operator_regret,3); %green
% 
% 
% %Simulation starts here
% T = 1000;
% 
% x_0 = zeros(dim.X,1);
% 
% %noise generation
% w = Noise_gen(dim,T,1);                 % The last parameter is to choose noise   1 is for Gaussian
% 
% %control signals
% out_s       = causal_filter(w,S_para,T,dim);
% 
% out_Kbar    = causal_filter(w,Kbar_para,T,dim);
% 
% uRegret     = causal_filter(out_s+out_Kbar,Dinv_para,T,dim);
% 
% uNC         = NC_control_seq(w,NC_causal_para, NC_anti_para,T,dim);
% 
% 
% %system evaluation
% xRegret     = Sys_eval(x_0,sys,-uRegret,w,T);
% 
% xNC         = Sys_eval(x_0,sys,uNC,w,T);
% 
% [xLQR, uLQR]       = Sys_eval_LQR(x_0,sys,Klqr,w,T);
% 
% %Costs assuming Q=R=I
% 
% for i=1:dim.X
%     Cost_NC(i)         =  T^(-1)*( xNC(i,:)*xNC(i,:)' + uNC(i,:)*uNC(i,:)' );
%     Cost_Regret(i)     = T^(-1)*( xRegret(i,:)*xRegret(i,:)' + uRegret(i,:)*uRegret(i,:)' );
%     Cost_LQR(i)        = T^(-1)*( xLQR(i,:)*xLQR(i,:)' + uLQR(i,:)*uLQR(i,:)' );
% end
% X(j) = sum(Cost_LQR(:));

% % sys1 = ss(T_para.F,T_para.G,T_para.H,0,-1);
% % sys2 = ss(S_para.F,S_para.G,S_para.H,S_para.J,-1);
% % 
% % bode(sys1,'b',sys2,'r--');
% 
% f=fft(x(1,:));    
% 
% plot(f.*conj(f))
