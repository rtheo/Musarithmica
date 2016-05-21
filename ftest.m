function s = ftest(d, k, cells )
% testing frequency domain as TM tape
clc, close all
fs = d/(128*k); t = fs:fs:d;
f = scale; 
clen = length(cells); if clen<64, cells = [cells, zeros(1, 64-clen)]; end
c = zeros(1,128); c(1:2:end) = 1; 
idx = 2*find( cells==1 )-1; c(idx) = 0; c(idx+1) = 1; 
s = signal( (f.*c), t ); 
periodogram(s,[],'twosided',128*k,fs);
end