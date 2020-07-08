function TF_sampled_complex = sample_anticausalTF(f_vec,TF)

TF_sampled_complex = zeros(size(TF.H,1),size(TF.G,2),length(f_vec));

for i=1:length(f_vec)
    
    z = exp(1i*f_vec(i));
    TF_sampled_complex(:,:,i) = TF.H*inv( inv(z)*eye(size(TF.F))-TF.F)*TF.G;

end


% TF_sampled_complex = squeeze(TF_sampled_complex);