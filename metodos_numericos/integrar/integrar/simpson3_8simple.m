function Resultados=simpson3_8simple(a,b,f)

% esta funcion calcula la integral de una funcion simbolica usando el
% metodo de simpson 3/8 toma como entrada un intervalo de a,b y una funcion
% a integrar
vars = symvar(f);
h=(b-a)/3;
I=3*h*double(subs(f,vars(1),a)+subs(f,vars(1),b)+3*subs(f,vars(1),(2*a+b)/3)+3*subs(f,vars(1),(a+2*b)/3))/8;

%Cálculo de la cota de error
y = a:0.01:b;
c=numel(y);   
derivada=diff(f,vars(1),2);
derivadamaxima = 0;
for i =1:c
    derivadaevaluada=abs(double(subs(derivada,y(i))));
    if derivadaevaluada >=  derivadamaxima    
        derivadamaxima=derivadaevaluada;
    end
end
Error=(3*derivadamaxima*h^5)/80;


Resultados=[1,I,Error];
end            