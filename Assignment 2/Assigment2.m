%Assigment 2 - Learning a rule
%David Fernández Chaves & Shafeef
%Neural Networks and Computational Intelligence

%General initialization
Alpha = 0.25:0.1:2;
NDimensions=20;             %Number of dimensions
nD=10;                      %Number of experiment to get the mean
P=round(Alpha*NDimensions);  %Number of samples based on Alfa

%Measures
Eg_MinOver = zeros(1,size(Alpha,2));
Eg_Adatron = zeros(1,size(Alpha,2));
T_MinOver = zeros(1,size(Alpha,2));
T_Adatron = zeros(1,size(Alpha,2));
Kw = zeros(1,size(Alpha,2));
Kw_MinOver = zeros(1,size(Alpha,2));
Kw_Adatron = zeros(1,size(Alpha,2));

for s_alfa = 1:size(Alpha,2)
    
    NSamples = P(s_alfa);
    
    %Each diferent nD set of D
    for s_nd=1:nD
        %Get Random dataset and teacher perceptron W*
        [Samples,Labels,W] = GetRandomDataSet(NDimensions,NSamples);        
        Kw(s_alfa) = Kw(s_alfa) + Stability(W,Samples,Labels);
        
        %MinOver
        tic
        [W_minOver] = MinOver(Samples,Labels,30*NSamples);
        T_MinOver(s_alfa) = T_MinOver(s_alfa) + toc;
        Kw_MinOver(s_alfa) = Kw_MinOver(s_alfa) + Stability(W_minOver,Samples,Labels);
        
        %Adatron
        tic
        [W_Adatron,t,X] = Adatron(Samples,Labels,100*NSamples);
        T_Adatron(s_alfa) = T_Adatron(s_alfa) + toc;
        Kw_Adatron(s_alfa) = Kw_Adatron(s_alfa) + Stability(W_Adatron,Samples,Labels);
        
        %Calculate the Generalization Error
        Eg_MinOver(s_alfa) = Eg_MinOver(s_alfa) + 1/pi * acos((W_minOver*W')/(norm(W_minOver)*norm(W)));
        Eg_Adatron(s_alfa) = Eg_Adatron(s_alfa) + 1/pi * acos((W_Adatron*W')/(norm(W_Adatron)*norm(W)));
    end
    
    Kw(s_alfa) = Kw(s_alfa)/nD;
    Kw_MinOver(s_alfa) = Kw_MinOver(s_alfa)/nD;
    Kw_Adatron(s_alfa) = Kw_Adatron(s_alfa)/nD;
    T_MinOver(s_alfa) = T_MinOver(s_alfa)/nD;
    T_Adatron(s_alfa) = T_Adatron(s_alfa)/nD;
    Eg_MinOver(s_alfa) = Eg_MinOver(s_alfa)/nD; 
    Eg_Adatron(s_alfa) = Eg_Adatron(s_alfa)/nD; 
    Alpha(s_alfa)
end

%Generalization Error Figure
figure
hold on
title('Comparison Generalization Error between MinOver and Adatron')
plot(Alpha,Eg_MinOver)
plot(Alpha,Eg_Adatron)
legend('MinOver','Adatron')
xlabel('Alpha values') 
ylabel('Averange Generalization Error') 


%Stabilities Figure
figure
hold on
title('Comparison Stabilities between Perceptron, MinOver and Adatron')
plot(Alpha,Kw)
plot(Alpha,Kw_MinOver)
plot(Alpha,Kw_Adatron)
legend('Perceptron','MinOver','Adatron')
xlabel('Alpha values') 
ylabel('Averange K(w)') 

%Time Figure
figure
hold on
title('Comparison Times between MinOver and Adatron')
plot(Alpha,T_MinOver)
plot(Alpha,T_Adatron)
legend('MinOver','Adatron')
xlabel('Alpha values') 
ylabel('Averange Time (s)') 