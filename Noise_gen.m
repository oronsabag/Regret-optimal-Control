function W = Noise_gen(dim,T,type)

if type ==1
W = randn(dim.X,T,1);                         % Gasussian noise sequence
% f=fft(W);                               % Discrete Fourier Transform with same length ;           
% plot(f.*conj(f));                        % plot spectrum of noise 
else
%     W = zeros(dim.X,T);
% W(:,1) = 1;
% seq = ones(dim.X,1);
%     W = repmat(seq ,[1,T]);       % Spikey noise sequence
seq = [1,0,0,0];
W = repmat(seq ,[dim.X,T/4]); 
% W = repmat([1,1,1,1]' ,[1,T]);       % Spikey noise sequence
% f=fft(W);                               % Discret Fourier Transform with same length ;           
% plot(f.*conj(f))                        % plot spectrum of noise 
end

% w = [1,0,0,0];
% 
% psd = zeros(1,257);
% psd(5)=2;
% 
% amp = sqrt(2*psd);
% phase = 2*pi*rand(1,257);
% 
% sig = amp.*phase;
% 
% sig_time = ifft(sig);
% 
% plot(abs(sig_time));
