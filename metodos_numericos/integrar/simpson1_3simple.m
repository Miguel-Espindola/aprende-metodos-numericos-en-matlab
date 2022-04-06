function Resultados=simpson1_3simple(a,b,f)


m=(a+b)/2;
I=(b-a)*double(subs(f,x,a)+subs(f,x,b)+4*subs(f,x,m))/6;

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

%Cálculo
format long;
Resultados=[1,I,Error];
end            