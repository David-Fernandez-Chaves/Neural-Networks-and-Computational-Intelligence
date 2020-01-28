function [W,t] = MinOver(Samples,Labels,Tmax)
%   MinOver algorithm

    NSamples = size(Samples,1);
    NDimensions = size(Samples,2); 
    
    W=zeros(1,NDimensions);
    Wold=ones(1,NDimensions);
    t=0;
    
    while (~isequal(W,Wold)) && (t<Tmax)
        Wold=W;
        
        %Get the min Stability
        minE=0;
        minSample=1;

        for step=1:NSamples
            
            E = W*(Samples(step,:)*Labels(step))';
            if E<minE 
                minE = E;
                minSample = step;
            end
            
        end
        
        %Hebbian update
        W = W + (Samples(minSample,:)*Labels(minSample))/NDimensions;
        
        t=t+1;
    end
    
end

