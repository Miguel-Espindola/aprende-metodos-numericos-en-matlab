function Resultados=newtonraphson(m,iterMax,Tol,f)
syms x real;
global sol1;
%Solución real en el intervalo dado
sol=vpasolve(f,x);
c=numel(sol);
sol1=[];
if c==1
    sol1(1)=sol(1);
else
    d=double(abs(sol(1)-abs(m)));
    j=1;
    while j<=c
        if abs(abs(sol(j))-abs(m)) <= d  
            sol1(1)=sol(j);
            d=abs(abs(sol1(1))-abs(m));
        end
        j=j+1;
    end
end

%Validacion
if numel(sol1)==0
    errordlg('No hay soluciones reales en el intervalo dado','Error');
    return
elseif numel(sol1)>1
    errordlg('Hay dos o mas soluciones reales en el intervalo dado', 'Error');
    return
end

%Cálculo
n=0;
Error=Tol+1;
valm=zeros(iterMax+1,1);
ErrorVect=zeros(iterMax+1,1);
derivada=double(subs(diff(f,x),x,m));
    while n<=iterMax && Error > Tol
        m=m-((double(subs(f,x,m)))/(double(subs(diff(f,x),x,m))));
        valm(n+1)=m;
        if n>=1
            Error=abs(valm(n+1)-valm(n));
            ErrorVect(n+1,1)=Error;
        end
        n=n+1;
    end
format long;
contador=0:iterMax;
Resultados=[transpose(contador),valm,ErrorVect];
Resultados=Resultados(1:n,:);
end            