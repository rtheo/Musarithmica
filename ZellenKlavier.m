function ZellenKlavier( cells, rule, steps, cutoff, duration, fs, fsplay )
if nargin < 7, fsplay = 44100; end
if nargin < 6, fs = 2^13; end
if nargin < 5, duration = 1; end
if nargin < 4, cutoff = 128; end
clc, close all
% Produce whole pitch frequency table for 64-bit isentropic word code
f0 = 440; freqs = 2.^((-45:82)/12)*f0;  fbeat = 2^(-48/12)*f0;
% Correct machine-E innacurracies (checked only in version 2007b with 32-bit running XP)
f1 = floor(freqs(1:44)) + floor( 10*mod( freqs(1:44), 1 ) )/10;
f2 =  floor(freqs(46:128)) + floor( 10*mod( freqs(46:128), 1 ) )/10;
freqs = [f1, f0, f2]; freqs = freqs( 1+mod( (0:127), cutoff) ); % apply cutoff for random compositions
% Expand cells for isentropic encoding
clen = length(cells); if clen<64, cells = [cells, zeros(1, 64-clen)]; end
if clen > 64, error('Cell array length exceeding max. capacity of 64 bits'), end
c = zeros(1,128); c(1:2:end) = 1; idx = 2*find( cells==1 )-1; c(idx) = 0; c(idx+1) = 1; 
% Load signal bank with cell states and complement
ifs = duration/fs; t=ifs:ifs:duration; 
sbank = sin( 2*pi*(c.*freqs)'*t ); % odd reference signals
csbank = sin( 2*pi*( (1-c).*freqs )'*t ); % even reference signals
keys = sbank; % initialize klavier
% extract transition table from rule byte by XOR-ing the middle input and output bits
r = ceil(mod(log2(bitxor(rule, rule+2.^(0:7))), 1)); % division-free rule bit exractor 
% ternary sign encoding used for permutations/shifts 
% 0: do nothing, 1: single -> beat, -1: beat -> single
mid = mod(floor( (0:7)/2 ), 2); r = xor( mid, r ).*( r - mid ); 
% main player loop
for i=1:steps
    k = 1;
    keycopy1 = circshift( keys, [2 0] );
    keycopy2 = circshift( keys, [-2 0] );
    for j=1:64
        tones = keys( k, : ) + 2*keycopy1( k, :) + 4*keycopy2( k, :); sound( tones, fsplay ), 
        ptr = 1+ceil( max(tones) ); disp(ptr), flag= r(ptr); rfilter = ( flag~=0 ); % primitive classifier
        if rfilter,
            keys( k, : ) = ( flag>0 )*sbank(k, : ); 
            keys( k+1, : ) = ( flag<0 )*csbank( k+1, : ); 
            %sound( [keys( k, : ) keys( k+1, : )], fsplay )
        end        
        sound( [keys( k, : ), fliplr(keys( k, : ))], fsplay )
        k = k + 1;
    end
end
end
