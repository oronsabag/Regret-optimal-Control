function TF_sampled_complex = sample_causalTF(f_vec,TF)

vec = exp(1i*f_vec);

TF_sampled_complex = zeros(size(TF.H,1),size(TF.G,2),length(vec));

for i=1:length(vec)
    
    TF_sampled_complex(:,:,i) = TF.H*inv(vec(i)*eye(size(TF.F))-TF.F)*TF.G + TF.J;

end


% TF_sampled_complex = squeeze(TF_sampled_complex);