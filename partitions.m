function partitions( n, options, duration, fs )
% Isospectral Polyphony from Integer Partitions
% All lists of partitions are extracted and sq. roots
% of their elements are interpreted as spectral coefficients
% REMINDER: Partition generator is NP and for n > 8 it may
% take time to complete
if nargin<4, fs = 44100; end
if nargin<3, duration = 0.5; end
if nargin<2, options = 'mono'; end
clc, close all
if strcmp(options, 'mono'), choice=1; end
if strcmp(options, 'reverse'), choice=2; end
if strcmp(options, 'stereo'), choice=3; end
octave = input('Enter lowest octave from total of 16 \n');
fgap = input('Enter frequency gap >= 2 - wait for partition list... \n'); 
[set, setdim] = mypart( n ); set = sqrt(set);
disp('List ready, now playing...')
if choice==2, set = fliplr( set ); end
f = scale; 
t = (1/fs):(1/fs):duration;
for i=1:setdim
    seq = unique( set( i, :) );
    firstpitch = 8*octave; 
    lastpitch = fgap*(length(seq)-1) + firstpitch - 1;
    fptr = zeros(1, 128);
    fptr(firstpitch:fgap:lastpitch) = seq(2:end);
    sig = signal( f.*fptr, t );
    if choice<3, 
        soundsc( sig, fs ) 
    else
        sigl = sig; seq = fliplr( seq );
        fptr = zeros(1, 128);
        fptr(firstpitch:fgap:lastpitch) = seq(2:end);
        sigr = signal( f.*fptr, t );            
        soundsc( [sigl, sigr], fs )
    end
end
end