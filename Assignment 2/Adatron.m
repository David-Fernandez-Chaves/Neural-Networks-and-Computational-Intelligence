function [W,t,X] = Adatron(Samples,Labels,Tmax,eta)
%   Adatron algorithm

    NSamples = size(Labels,1);
    NDimensions = size(Samples,2); 
    
    Samples = [Samples,-1*ones(length(Labels),1)];
    
    W=zeros(1,NDimensions+1);
    X=zeros(1,NSamples);
    t=0;
    step = 1;

    while t<Tmax

        wt=0;
        for ss = 1:NSamples
            wt=wt + X(ss)*Samples(ss,:)*Labels(ss);
        end

        W = wt/NDimensions;

        E = dot(W,Samples(step,:))*Labels(step);

        %Update the embedding strenght
        X(step) = X(step) + eta * (1 - E);           
        X = max(X,0); 
        

        %Next Sample
        step = step +1;
        if step > NSamples
            step=1;
        end
        
        t=t+1;
    end
    
end

