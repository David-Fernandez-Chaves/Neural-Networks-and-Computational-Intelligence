%David Fernández Chaves & Shafeef

%General initialization
Alpha = 0.75:0.1:3.5;
Pls = zeros(1,size(Alpha,2));
Qls = zeros(1,size(Alpha,2));

Ndimensions=20;             %Number of dimensions
Nmax=100;                   %Number max of iteration to learnd
nD=300;                      %Number of experiment to get the mean
P=round(Alpha*Ndimensions);  %Number of samples based on Alfa
C=0.5;                      %Constant C>0

%Each diferent Alfa
for s_alfa = 1:size(Alpha,2)
    
    p = P(s_alfa);
    
    %Each diferent nD set of D
    for s_nd=1:nD
        %Initialization
        Bias = 0;

        Weights = [zeros(1,Ndimensions),Bias];
        Input = [normrnd(0,1,Ndimensions,p);-ones(1,p)];
        Output = (randi([0 1],p,1)*-2)+1;

        %Loop learning process
        for iteration = 1:Nmax
            found = 0;

            %Loop each samples
            for step = 1:p

                out = Weights*Input(:,step)*Output(step);

                if out <= C
                    Weights = Weights + (Input(:,step)'*Output(step))/Ndimensions;
                else
                    found = found +1;
                end          
            end

            if found == p
                Qls(s_alfa) = Qls(s_alfa) + 1;
                break
            end
        end     
    end
    
    Qls(s_alfa) = Qls(s_alfa)/nD;
    
    %Calculate Pls (Theorical)
    Cpn=0;
    if p<=Ndimensions
        Pls(s_alfa) = 1;
    else
        for j=0:(Ndimensions-1)
            Cpn = Cpn +  factorial(p-1)/(factorial(j)*factorial(p-1-j));
        end
        Pls(s_alfa) = 2^(1-p)*Cpn;
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


