function [W,t] = Adatron(Samples,Labels,tmax)
%   Adatron algorithm

    NSamples = size(Samples,2);
    NDimensions = size(Samples,1); 
    
    W=zeros(1,NDimensions);
    Wold=ones(1,NDimensions);
    X=zeros(NDimensions,NSamples);
    t=0;
    step = 1;
    
    %Parametres
    eta=0.1;

    while (~isequal(W,Wold)) && (t<tmax)
        Wold=W;       

        E = W*Samples(:,step)*Labels(step);

        %Update the embedding strenght
        X(:,step) = X(:,step) + eta * (1 - E);           
        X = max(X,0);     

        %Next Sample
        step = step +1;
        if step > NSamples
            step=1;
        end
        
        %Calculate W from embedding strenght
        for s = 1:NSamples
            W = W + X(:,s)' .* Samples(:,s)'*Labels(s); 
        end
        W = W/NDimensions; 
        
        t=t+1;
    end
    
end

