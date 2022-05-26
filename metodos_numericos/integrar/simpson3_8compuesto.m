function Resultados=simpson3_8compuesto(a,b,f,n)

% esta función calcula la integral de una función en un intervalo dado con
% un n número de subintervalos usando el método de simpson3/8 la salida es
% una matriz de 3xn donde la primera columna es la interacción, la segunda el
% valor obtenido y la tercera el error obtenido en esa interacción



%Solución real en el intervalo dado


%Cálculo
i=1;
valm=zeros(n+1,1);
ErrorVect=zeros(n+1,1);
h=(b-a)/n;
m=0;
while i<= n
    ant=simpson3_8simple(a+(i-1)*h,a+(i-1)*h+h,f);
    m=m+ant(2);
    valm(i+1)=m;
    if n>=1
        Error=abs(valm(i+1)-valm(i));
        ErrorVect(i+1,1)=Error;
    end
    i=i+1;
end

contador=0:n;
Resultados=[transpose(contador),valm,ErrorVect];
Resultados=Resultados(1:n+1,:);
end