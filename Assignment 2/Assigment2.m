%Assigment 2 - Learning a rule
%David Fernández Chaves & Shafeef
%Neural Networks and Computational Intelligence

%General initialization
Alpha = 0.75:0.1:3.5;
Ndimensions=20;             %Number of dimensions
nD=20;                      %Number of experiment to get the mean
P=round(Alpha*Ndimensions);  %Number of samples based on Alfa
averangeGeneralError = zeros(1,size(Alpha,2));;

for s_alfa = 1:size(Alpha,2)
    
    nSamples = P(s_alfa);
    
    %Each diferent nD set of D
    for s_nd=1:nD
        %Initialization

        S = normrnd(0,1,Ndimensions,nSamples);
        Labels = (randi([0 1],nSamples,1)*-2)+1;

        [W,K] = MinOver(S,Labels);
        
        e= 1/pi * arcos((W*WW)/(norm(W)*norm(WW)));
        averangeGeneralError(s_alfa) = averangeGeneralError(s_alfa) + e;
    end
    
    averangeGeneralError(s_alfa) = averangeGeneralError(s_alfa)/nD; 
    
end

figure
hold on
title('Comparison between General Error')
plot(Alpha,Pls)
legend('General Error')
xlabel('Alpha values') 
ylabel('General Error') 