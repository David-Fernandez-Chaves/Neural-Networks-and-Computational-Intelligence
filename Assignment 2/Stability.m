function [K] = Stability(W,Samples,Labels)
%Stability
%   Calculate the stability from W
    NSamples = size(Samples,1);
    K = (dot(W,Samples(1,:))*Labels(1))/norm(W);
    
    for step=2:NSamples            
        Kt = (dot(W,Samples(step,:))*Labels(step))/norm(W);
        if Kt<K 
            K = Kt;
        end            
    end
end