function [W,t] = MinOver(Samples,Labels,tmax)
%   MinOver algorithm

    NSamples = size(Samples,2);
    NDimensions = size(Samples,1); 
    
    W=zeros(1,NDimensions);
    Wold=ones(1,NDimensions);
    t=0;
    
    
    while (~isequal(W,Wold)) && (t<tmax)
        Wold=W;
        
        %Get the min Stability
        minE=0;
        minSample=1;

        for stp=1:NSamples
            
            E = W*Samples(:,stp)*Labels(stp);
            if E<minE 
                minE = E;
                minSample = stp;
            end
            
        end
        
        %Hebbian update
        W = W + 1/NDimensions * (Samples(:,minSample)'*Labels(minSample));
        
        t=t+1;
    end
    
end

