function [save, k] = mypart(n)
% MYPART : INTEGER PARTITIONS FROM UNIVERSAL LEXICONS 
% (Fast, small numbers version)
% Given a powerset of integers of binary log = n it extracts all partitions
% from the binary lexicon of the associated bit strings. Use prime list
% to make a repetition avoidance filter.
% -----------------------------------------------------
%
% T. E. Raptis, (c) 2010
% http://cag.dat.demokritos.gr
% rtheo@dat.demokritos.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lex = fliplr(ff2n(2*n));
plist = primes(  2^(2*n+1) );
save = []; mem = [0]; k = 0;
for i=1:2^(2*n-1)
   [cdim, cv] = bitblocks(lex(i,:));
   cv = abs(cv) - 1; idx = prod(plist( cv+1 ));
   flag = sum( idx*ones(1,length(mem)) == mem ) == 0;
   if cdim == n && flag, 
       mem = [mem, idx]; save = vertcat(save, cv); k = k + 1;
   end   
end
end
