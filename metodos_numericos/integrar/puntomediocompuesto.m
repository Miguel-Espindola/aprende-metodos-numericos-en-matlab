function Resultados=puntomediocompuesto(a,b,f,n)
% esta funcion calcula la integral mediante el metodo del punto medio
% compuesto, toma como entrada un valor inicial, uno final, una funcion
% simbolica y un numero de subintervalos, devuelve una matriz de tamaño nx3
    m=0;
    i=1;
    valm=zeros(n,1);
    ErrorVect=zeros(n,1);
    h=(b-a)/n;
    while i< n
        ant=puntomediosimple(a+(i-1)*h,a+(i-1)*h+h,f);
        m=m+ant(2);
        valm(i)=m;
        if n>=1
            Error=abs(valm(i)-valm(i));
            ErrorVect(i,1)=Error;
        end
        i=i+1;
    end
    contador=1:n;
    Resultados=[transpose(contador),valm,ErrorVect];
    Resultados=Resultados(1:n+1,:);
end