%Assigment 1 - Perceptron Training
%David Fernández Chaves & Shafeef
%Neural Networks and Computational Intelligence

%General initialization
Alpha = 0.75:0.1:3.5;
Pls = zeros(1,size(Alpha,2));
Qls = zeros(1,size(Alpha,2));

NDimensions=20;              %Number of dimensions
nD=200;                      %Number of experiment to get the mean
P=round(Alpha*NDimensions);  %Number of samples based on Alfa


%Each diferent Alfa
for s_alfa = 1:size(Alpha,2)
    
    NSamples = P(s_alfa);
    
    %Each diferent nD set of D
    for s_nd=1:nD
        
        %Initialization a new DataSet
        Samples = normrnd(0,1,NDimensions,NSamples);
        Labels = (randi([0 1],NSamples,1)*-2)+1;
        
        %Perceptron
        [W,Q]=Perceptron(Samples,Labels,5*NSamples,0.1);
        Qls(s_alfa) = Qls(s_alfa) + Q;
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
    
    Alpha(s_alfa)
end

figure
hold on
title('Comparison between Pls and Qls')
plot(Alpha,Pls)
plot(Alpha,Qls)
legend('Pls','Qls')
xlabel('Alpha values') 
ylabel('Probabilities') 


