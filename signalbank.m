function signalbank(d, k, low)
% try d=3; k=128; 
clc, close all
fs = d/(128*k); t = fs:fs:d; 
f = scale; k2 = 6*low; k1 = k2 - 5;
words = fliplr( ff2n(6) );
k = 0;
for i=1:64 
     w=words(i,:); 
     if sum(w)==3 && sum(w(1:2))*sum(w(3:4))*sum(w(5:6))==1 
         k = k + 1; s = signal( (f(k1:k2).*w), t ); y = sum(s, 1);
         sound(y), psd(y), title(['word: ',num2str(w)]), pause
     end 
 end
