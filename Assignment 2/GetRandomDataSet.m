function [Samples,Labels,W] = GetRandomDataSet(NDimensions,NSamples)

    C=0.1;                      %Constant C>0
    Nmax=100;                   %Number max of iteration to learnd
    found = 0;
    
    while found ~= NSamples


        W = zeros(1,NDimensions);
        Samples = normrnd(0,1,NSamples,NDimensions);
        Labels = (randi([0 1],NSamples,1)*-2)+1;


        for iteration = 1:Nmax
                found = 0;

                %Loop each samples
                for step = 1:NSamples

                    E = W*(Samples(step,:)*Labels(step))';

                    if E < C
                        W = W + (Samples(step,:)*Labels(step))/NDimensions;
                    else
                        found = found +1;
                    end          
                end

                if found == NSamples
                    break
                end
        end
        
        %Force the initial condition norm(W)^2=NDimensions
        W = (W*sqrt(NDimensions))/norm(W);

    end    
    
end

