function sbanktest(low)
clc, close all
d = 3; k = 64;
f0 = 440; fbeat = 2^(-48/12)*f0;
ifs = d/(128*k); t = ifs:ifs:d; 
f = scale; k2 = 6*low; k1 = k2 - 5;
beat = sin(2*pi*fbeat*t);
words = fliplr( ff2n(6) );
k = 0;
for i=1:64 
     w=words(i,:); 
     if sum(w)==3 && sum(w(1:2))*sum(w(3:4))*sum(w(5:6))==1 
         k = k + 1;
         s = cos( 2*pi*(f(k1:k2).*w)'*t );
         for j=1:6, s(j, :) = s(j, :) + w(j)*beat; end, 
         y = s(1, :) + 2*s(3, :) + 4*s(5, :); 
         figure(1), plot(y), sound(y), ch(k) = sum(y);
         figure(2), psd(y), title([num2str(k),' word: ',num2str(w),' character: ', num2str(ch(k)) ]), pause        
     end
end
ch = 8*ch/max(ch); disp( ceil(ch) )
bar(ch)
end