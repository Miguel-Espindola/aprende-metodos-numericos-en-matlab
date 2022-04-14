function Resultados=simpson1_3simple(a,b,f)

% esta funcion calcula la integral de una funcion simbolica usando el
% metodo de simpson 1/3 toma como entrada un intervalo de a,b y una funcion
% a integrar
vars = symvar(f);
m=(a+b)/2;
I=(b-a)*double(subs(f,vars(1),a)+subs(f,vars(1),b)+4*subs(f,vars(1),m))/6;

%Cálculo de la cota de error
y = a:0.01:b;
c=numel(y);   
derivada=diff(f,x,2);
for i =1:c
    derivadaevaluada=abs(double(subs(derivada,y(i))));
    if derivadaevaluada >=  derivadamaxima    
        derivadamaxima=derivadaevaluada;
    end
end
Error=(derivadamaxima*(b-a)^5)/90;

Resultados=[1,I,Error];
end            