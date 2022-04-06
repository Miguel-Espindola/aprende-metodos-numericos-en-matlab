function Resultados=simpson3_8compuesto(a,b,f,n)

% esta funcion calcula la integral de una funcion en un intervalo dado con
% un n numero de subintervalos usando el metodo de simpson3/8 la salida es
% una matriz de 3xn donde la primer columna es la iteracion, la segunda el
% valor obtenido y la tercera el error obtenido en esa iteracion
m=0;

%Solución real en el intervalo dado


%Cálculo
i=1;
valm=zeros(n+1,1);
ErrorVect=zeros(n+1,1);
h=(b-a)/n;

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