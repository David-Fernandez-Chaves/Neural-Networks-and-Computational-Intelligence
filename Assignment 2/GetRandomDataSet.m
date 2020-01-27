function [Samples,Labels,W] = GetRandomDataSet(NDimensions,NSamples)

    C=0.1;                      %Constant C>0
    Nmax=100;                   %Number max of iteration to learnd
    found = 0;
    
    while found ~= NSamples


        W = zeros(1,NDimensions);
        Samples = normrnd(0,1,NDimensions,NSamples);
        Labels = (randi([0 1],NSamples,1)*-2)+1;


        for iteration = 1:Nmax
                found = 0;

                %Loop each samples
                for stp = 1:NSamples

                    out = W*Samples(:,stp)*Labels(stp);

                    if out <= C
                        W = W + (Samples(:,stp)'*Labels(stp))/NDimensions;
                    else
                        found = found +1;
                    end          
                end

                if found == NSamples
                    break
                end
        end
        
        %Force the initial condition
        W = (W*sqrt(NDimensions))/sqrt(norm(W)^2);
        

        found = 0;

        %Loop each samples to check 
        for stp = 1:NSamples

            out = W*Samples(:,stp)*Labels(stp);

            if out > 0
                found = found +1;
            end          
        end
    
    end    
    
end

