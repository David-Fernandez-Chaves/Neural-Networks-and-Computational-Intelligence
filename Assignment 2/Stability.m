function [K] = Stability(W,Samples,Labels)
%Stabilitie 
%   Calculate the stability

    nSamples = size(Samples,2);
    K= (W*Samples(:,1)*Labels(1))/norm(W);
    
    for stp=2:nSamples            
        Kt = (W*Samples(:,stp)*Labels(stp))/norm(W);
        if Kt<K 
            K = Kt;
        end            
    end
end