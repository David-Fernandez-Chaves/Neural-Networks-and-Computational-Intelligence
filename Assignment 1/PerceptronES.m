function [W,Qls,X] = PerceptronES(Samples,Labels,Tmax,C)
%   MinOver algorithm

    NSamples = size(Samples,1);
    NDimensions = size(Samples,2);  
    X=zeros(1,NSamples);
    W = zeros(1,NDimensions);  
    Qls=0;
    
    %Loop learning process
    for iteration = 1:Tmax
        found = 0;
        
        %Loop each samples
        for step = 1:NSamples
            
            wt=0;
            for ss = 1:NSamples
                wt=wt + X(ss)*Samples(ss,:)*Labels(ss);
            end
            
            W = wt/NDimensions;
            
            E = W*(Samples(step,:)*Labels(step))';

            %Update the embedding strenght
            if E < C
                X(step) = X(step) + 1; 
            else
                found = found +1;
            end          
        end

        if found == NSamples
            Qls = Qls + 1;
            break
        end
    end 
    
end

