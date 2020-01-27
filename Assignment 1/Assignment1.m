%Assigment 1 - Perceptron Training
%David Fernández Chaves & Shafeef
%Neural Networks and Computational Intelligence

%General initialization
Alpha = 0.75:0.1:3.5;
Pls = zeros(1,size(Alpha,2));
Qls = zeros(1,size(Alpha,2));

NDimensions=20;             %Number of dimensions
Nmax=100;                   %Number max of iteration to learnd
nD=300;                      %Number of experiment to get the mean
P=round(Alpha*NDimensions);  %Number of samples based on Alfa
C=0.5;                      %Constant C>0

%Each diferent Alfa
for s_alfa = 1:size(Alpha,2)
    
    NSamples = P(s_alfa);
    
    %Each diferent nD set of D
    for s_nd=1:nD
        %Initialization
        Bias = 0;

        Weights = [zeros(1,NDimensions),Bias];
        S = [normrnd(0,1,NDimensions,NSamples);-ones(1,NSamples)];
        Labels = (randi([0 1],NSamples,1)*-2)+1;

        %Loop learning process
        for iteration = 1:Nmax
            found = 0;

            %Loop each samples
            for step = 1:NSamples

                out = Weights*S(:,step)*Labels(step);

                if out <= C
                    Weights = Weights + (S(:,step)'*Labels(step))/NDimensions;
                else
                    found = found +1;
                end          
            end

            if found == NSamples
                Qls(s_alfa) = Qls(s_alfa) + 1;
                break
            end
        end     
    end
    
    Qls(s_alfa) = Qls(s_alfa)/nD;
    
    %Calculate Pls (Theorical)
    Cpn=0;
    if NSamples<=NDimensions
        Pls(s_alfa) = 1;
    else
        for j=0:(NDimensions-1)
            Cpn = Cpn +  factorial(NSamples-1)/(factorial(j)*factorial(NSamples-1-j));
        end
        Pls(s_alfa) = 2^(1-NSamples)*Cpn;
    end    
    
end

Pls
Qls

figure
hold on
title('Comparison between Pls and Qls')
plot(Alpha,Pls)
plot(Alpha,Qls)
legend('Pls','Qls')
xlabel('Alpha values') 
ylabel('Probabilities') 


