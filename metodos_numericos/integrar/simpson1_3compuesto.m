function Resultados=simpson1_3compuesto(a,b,f,n)

%Cálculo
i=1;
valm=zeros(n+1,1);
ErrorVect=zeros(n+1,1);
h=(b-a)/n;

while i<= n
    ant=simpson1_3simple(a+(i-1)*h,a+(i-1)*h+h,f);
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