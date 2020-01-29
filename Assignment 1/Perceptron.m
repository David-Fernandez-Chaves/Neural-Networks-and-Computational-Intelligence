function [W,Qls] = Perceptron(Samples,Labels,Tmax,C)
%   MinOver algorithm

    NSamples = size(Samples,1);
    NDimensions = size(Samples,2);                 
    W = zeros(1,NDimensions);  
    Qls=0;
    
    %Loop learning process
    for iteration = 1:Tmax
        found = 0;

        %Loop each samples
        for step = 1:NSamples

            E = dot(W,Samples(step,:))*Labels(step);

            if E <= C
                W = W + (Samples(step,:)*Labels(step))/NDimensions;
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

