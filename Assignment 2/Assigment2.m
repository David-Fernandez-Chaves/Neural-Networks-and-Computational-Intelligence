%Assigment 2 - Learning a rule
%David Fernández Chaves & Shafeef
%Neural Networks and Computational Intelligence

%General initialization
Alpha = 0.75:0.1:3.5;
Ndimensions=20;             %Number of dimensions
nD=20;                      %Number of experiment to get the mean
P=round(Alpha*Ndimensions);  %Number of samples based on Alfa

for s_alfa = 1:size(Alpha,2)
    
    p = P(s_alfa);
    
    %Each diferent nD set of D
    for s_nd=1:nD
        %Initialization

        Inputs = normrnd(0,1,Ndimensions,p);
        Labels = (randi([0 1],p,1)*-2)+1;

        [W,K] = MinOver(Inputs,Labels);
           
    end
end
