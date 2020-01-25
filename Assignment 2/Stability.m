function [K] = Stability(W,S,Label)
%Stabilitie 
%   Calculate the stability

K=(W*S*Label)/norm(W);


end

