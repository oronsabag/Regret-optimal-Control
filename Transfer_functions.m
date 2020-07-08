function T_func =  Transfer_functions (sys)


% T_func.D          = TF_D(sys); %debug
T_func.Dinv       = TF_Dinv(sys);
T_func.F          = TF_F(sys);
T_func.G          = TF_G(sys);
T_func.T          = TF_T(sys);
T_func.S          = TF_S(sys);

[T_func.NC_caus, T_func.NC_anticaus] = TF_NonCausal(sys,T_func.S,T_func.T);

T_func.Kinf       = find_Kinf(sys);
T_func.KH2         = TF_H2(sys);


%%Find the Nehari controller transfer function
g_opt = Find_gopt_Nehari(T_func.T);

disp(['Optimal Regret = ',num2str(g_opt)]);

g = sqrt(g_opt)+0.0000001;

disp(['Effective Gamma = ',num2str(g)]);

T_func.Kbar = TF_Kbar(T_func.T,g);


