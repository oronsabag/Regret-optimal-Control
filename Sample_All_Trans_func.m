function Sampled_TFs = Sample_All_Trans_func(f_vec,Tran_func)

Sampled_TFs.F               = sample_causalTF(f_vec,Tran_func.F);
Sampled_TFs.G               = sample_causalTF(f_vec,Tran_func.G);
% Sampled_TFs.D              = sample_causalTF(f_vec,Tran_func.D); %debug
Sampled_TFs.Dinv            = sample_causalTF(f_vec,Tran_func.Dinv);
Sampled_TFs.Kbar            = sample_causalTF(f_vec,Tran_func.Kbar);
Sampled_TFs.S               = sample_causalTF(f_vec,Tran_func.S);
Sampled_TFs.NC_caus         = sample_causalTF(f_vec,Tran_func.NC_caus);
Sampled_TFs.Kinf            = sample_causalTF(f_vec,Tran_func.Kinf);
Sampled_TFs.KH2             = sample_causalTF(f_vec,Tran_func.KH2);

Sampled_TFs.T               = sample_anticausalTF(f_vec,Tran_func.T);
Sampled_TFs.NC_anticaus     = sample_anticausalTF(f_vec,Tran_func.NC_anticaus);