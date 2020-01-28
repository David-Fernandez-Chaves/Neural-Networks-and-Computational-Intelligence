function [K] = Stability(W,Samples,Labels)
%Stabilitie 
%   Calculate the stability

    NSamples = size(Samples,1);
    K = (W*(Samples(1,:)*Labels(1))')/norm(W);
    
    for step=2:NSamples            
        Kt = (W*(Samples(step,:)*Labels(step))')/norm(W);
        if Kt<K 
            K = Kt;
        end            
    end
end