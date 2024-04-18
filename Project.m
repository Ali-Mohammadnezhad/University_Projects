
[x, fs] = audioread('track.wav');
x = x(:, 1);
xmax = max(abs(x));
x = x/xmax;
%........................................
xlen = length(x);
wlen = 1024;
h = wlen/4;
nfft = 4096;
%........................................
if size(x,2) > 1
    x = x';
end
xlen = length(x); 
win = hamming(wlen, 'periodic');
rown = nfft;   
coln = 1+fix((xlen-wlen)/h);        
stft = zeros(rown, coln); 
%.......................................
indx = 0;
col = 1;
while indx + wlen <= xlen
   
    xw = x(indx+1:indx+wlen).*win;
    
    
    X = fft(xw, nfft);
    
   
    stft(:,col) = X(1:(rown));
    
    
    indx = indx + h;
    col = col + 1;
end
t = (wlen/2:h:xlen-wlen/2-1)/fs;
f = (0:rown-1)*fs/nfft;
K = sum(hamming(wlen, 'periodic'))/wlen;
stft = abs(stft)/wlen/K;
%......................................
stft = 20*log10(stft + 1e-6);
figure(1)
imagesc(t, f, stft);
set(gca,'YDir','normal')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Amplitude spectrogram of the signal')
handl = colorbar;
set(handl, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(handl, 'Magnitude, dB')