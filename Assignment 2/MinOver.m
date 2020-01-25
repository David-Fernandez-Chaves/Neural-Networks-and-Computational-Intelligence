function [W,K] = MinOver(S,Labels)
%   MinOver algorithm

    Bias = 0;
    nSamples = size(S,2);
    Ndimensions = size(S,1); 
    
    W=[zeros(1,Ndimensions),Bias];
    Wold=[ones(1,Ndimensions),Bias];
    S = [S;-ones(1,nSamples)];
    tmax=200000;
    t=0;
    
    
    while (~isequal(W,Wold)) && (t<tmax)
        Wold=W;
        
        %Get the min Stability
        minE=0;
        minSample=1;

        for step=1:nSamples
            
            E = W*S(:,step)*Labels(step);
            if E<minE 
                minE = E;
                minSample = step;
            end
            
        end
        
        %Hebbian update
        W = W + 1/Ndimensions * (S(:,minSample)'*Labels(minSample));
        
        t=t+1;
    end


    %Calculate Stability
    K=Stability(W,S(:,1),Labels(1));
    for step=2:nSamples            
        Kt = Stability(W,S(:,step),Labels(step));
        if Kt<K 
            K = Kt;
        end            
    end
end

