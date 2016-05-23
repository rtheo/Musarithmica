function powerset(n, k, duration, reverse, fs)
% Polyphony of Integer Powersets
% The sound of powersets in
% isentropic code. The higher n, 
% the lower k for normal hearing
if nargin<5, fs = 44100; end
if nargin<4, reverse = 0; end
if nargin<3, duration = 1; end
if nargin<2, k = 4; end
dim = 2^n; new = 2*n;
low = k*new+1; up = (k+1)*new;
if up>128, error('Out of scale: arg2 too large!'), end
if reverse, lex = fliplr( ff2n( n ) ); else lex = ff2n( n ); end
f = scale; t = (1/fs):(1/fs):duration;
for i=1:dim
    seq = incode( lex( i, :) );
    sig = signal( f( low:up ).*seq, t );
    soundsc( sig, fs ),% pause
end
end
