function [W,t] = MinOver(Samples,Labels,Tmax,WW)
%   MinOver algorithm

    NSamples = size(Labels,1);
    NDimensions = size(Samples,2); 
    
    Samples = [Samples,-1*ones(length(Labels),1)];
    
    W=zeros(1,NDimensions+1);
    Wold=ones(1,NDimensions+1);
    t=0;
    angle=0;
    NormWW = norm(WW);
    
    while (~isequal(W,Wold)) && (t<Tmax)
        Wold=W;
        
        %Get the min Stability
        minE= dot(W,Samples(1,:))*Labels(1);
        minSample=1;

        for step=2:NSamples
            E = dot(W,Samples(step,:))*Labels(step);
            if E<minE 
                minE = E;
                minSample = step;
            end
            
        end
        
        %Hebbian update
        W = W + (Samples(minSample,:)*Labels(minSample))/NDimensions;
        
        %Calculate the angle
        a = acos(dot(W,WW)/(NormWW*norm(W)))/pi;
        
        if isequal(a,angle)            
            break;
        else
            angle=a;
        end
        
        t=t+1;
    end
    
end

