function Resultados=puntomediocompuesto(a,b,f,n)
% esta función calcula la integral mediante el método del punto medio
% compuesto, toma como entrada un valor inicial, uno final, una función
% simbólica y un numero de subintervalos, devuelve una matriz de tamaño nx3


sol1=double(int(f,a,b));
m = 0;
%Cálculo
i=1;
valm=zeros(n+1,1);
ErrorVect=zeros(n+1,1);
h=(b-a)/n;

while i<= n
    ant=puntomediosimple(a+(i-1)*h,a+(i-1)*h+h,f);
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