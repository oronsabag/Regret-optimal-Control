function g_opt = Find_gopt_Nehari(T)

LyaK = Lyapunov_K(1,T);

g_opt = max(svd(LyaK.Z*LyaK.PI));