function signalbank(d, k, low)
% d=3; k=64; 
fs = d/(128*k); t = fs:fs:d; 
f = scale; k2 = 6*low; k1 = k2 - 5;
words = fliplr( ff2n(6) );
for i=1:64 
     w=words(i,:); 
     if sum(w)==3 && sum(w(1:2))*sum(w(3:4))*sum(w(5:6)) 
         s = signal( (f(k1:k2).*w), t ); sound(s, 5/fs), pause(0.1)
     end, 
 end