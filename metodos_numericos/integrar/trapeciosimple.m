function Resultados=trapeciosimple(a,b,f)
% esta funcion calcula la integral de una funcion simbolica en un intervalo
% de a,b usando el metodo del trapecio, la respuesta es un vector de 1x3
% donde la primer columna es la iteracion, la segunda el valor obtenido y
% la tercera el error obtenido 



I=(b-a)*double(subs(f,x,a)+subs(f,x,b))/2;

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
Error=(derivadamaxima*(b-a)^3)/12;


Resultados=[1,I,Error];
end            