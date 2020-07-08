function maxSV = maxSV_vec(F_freq_sampled,f_vec)

for i=1:length(f_vec)
    
    maxSV(i) = max(svd(F_freq_sampled(:,:,i)))^2;
    
end

%disp(max(maxSV(:)));