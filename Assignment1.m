%David Fernández Chaves

Alfa = 0.75:0.25:3;

Ndimensions=20;
Iterations=100;
P=round(Alfa*Ndimensions);

figure
hold ON

%Apart E
for ii = 1:size(P,2)
    for k=1:nd
        %Initialization
        Bias = 0;
        C=0.5;

        Weights = [zeros(1,Ndimensions),Bias];

        Input = [normrnd(0,1,Ndimensions,P(ii));-ones(1,P(ii))];
        Output = (randi([0 1],P(ii),1)*-2)+1;

        %Loop learning proceed
        for i = 1:Iterations
            out = zeros(4,1);
            found = 0;

            %Loop each samples
            for j = 1:P(ii)

                out(j) = Weights*Input(:,j)*Output(j);

                if out(j) <= C
                    Weights = Weights + (Input(:,j)'*Output(j))/Ndimensions;
                else
                    found = found +1;
                end          
            end

            if found == P
                break
            end
        end

        %Calculate Pls

        for j=0:Ndimensions-1
           Cpn =  factorial(P(ii)-1)/(factorial(j)*factorial(P(ii)-j-1));
        end
        Pls = 2*Cpn/pow(2,P(ii));
    end
end





solved
Weights*Input
Output