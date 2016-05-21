function [f, fodd, feven] = scales
% Produce whole pitch frequency table (64-bit isentropic register)
f0 = 440; freqs = 2.^((-45:82)/12)*f0; 
% correct machine-E innacurracies (checked only in version 2007b with XP)
f1 = floor(freqs(1:44)) + floor( 10*mod( freqs(1:44), 1 ) )/10;
f2 =  floor(freqs(46:128)) + floor( 10*mod( freqs(46:128), 1 ) )/10;
f = [f1, f0, f2];
fodd = f.*( mod((1:128),2)==1 );
feven = f.*( mod((1:128),2)==0 );
end