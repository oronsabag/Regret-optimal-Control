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

subplot(1,2,2)
hold on
plot_color(freq_vec,H2_Frob,1);
plot_color(freq_vec,NC_Frob,2);
plot_color(freq_vec,regret_Frob,3);
plot_color(freq_vec,Hinf_Frob,4);