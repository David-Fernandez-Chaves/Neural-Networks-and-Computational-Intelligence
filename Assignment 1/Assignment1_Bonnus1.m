%Assigment 1 - Perceptron Training
%David Fernández Chaves & Shafeef
%Neural Networks and Computational Intelligence

%General initialization
Alpha = 0.75:0.1:3;
N = 2:1:40;                  %Number of dimensions

nD=100;                      %Number of experiment to get the mean

Pls = zeros(size(N,2),size(Alpha,2));
Qls = zeros(size(N,2),size(Alpha,2));
    

for s_N = 1:size(N,2)

    NDimensions=N(s_N);              
    P=round(Alpha*NDimensions);      %Number of samples based on Alfa

    %Each diferent Alfa
    for s_alfa = 1:size(Alpha,2)

        NSamples = P(s_alfa);

        %Each diferent nD set of D
        for s_nd=1:nD

            %Initialization a new DataSet
            Samples = normrnd(0,1,NSamples,NDimensions);
            Labels = (randi([0 1],NSamples,1)*-2)+1;

            %Perceptron
            [W,Q]=Perceptron(Samples,Labels,5*NSamples,0.1);
            Qls(s_N,s_alfa) = Qls(s_N,s_alfa) + Q;
        end

        Qls(s_N,s_alfa) = Qls(s_N,s_alfa)/nD;

        %Calculate Pls (Theorical)
        Cpn=0;
        if NSamples<=NDimensions
            Pls(s_N,s_alfa) = 1;
        else
            for j=0:(NDimensions-1)
                Cpn = Cpn +  factorial(NSamples-1)/(factorial(j)*factorial(NSamples-1-j));
            end
            Pls(s_N,s_alfa) = 2^(1-NSamples)*Cpn;
        end    

        Alpha(s_alfa)
    end
end

%Plot Pls and Qls with regard to Alpha and N values
figure
hold on
title('Comparison between Pls and Qls')
surface(Alpha,N,Qls,'FaceAlpha',0.5,'FaceColor','r')
surface(Alpha,N,Pls,'FaceAlpha',0.5,'FaceColor','g')
legend('Pls','Qls')
xlabel('Alpha values') 
ylabel('N values') 
zlabel('Probabilities') 


