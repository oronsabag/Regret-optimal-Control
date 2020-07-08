function Frob = Frobenius_vec(F_freq_sampled,f_vec)

for i=1:length(f_vec)
    
    Frob(i) = (trace (abs( F_freq_sampled(:,:,i)' * F_freq_sampled(:,:,i)  )) );
    
end