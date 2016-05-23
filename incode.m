function c = incode( bits )
% encode any binary word
% in words of const. entropy log(2)
c = zeros(1, 2*length(bits) ); 
c(1:2:end) = 1; 
idx = 2*find( bits==1 )-1; 
c(idx) = 0; c(idx+1) = 1;
end