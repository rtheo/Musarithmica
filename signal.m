function s = signal( f,  t )
y = cos( 2*pi*(f'*t) ); imagesc(y)
s = sum( y, 1);
end