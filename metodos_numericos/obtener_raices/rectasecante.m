function Resultados=rectasecante(x_0,x_1,iterMax,Tol,f)
syms x real;
global sol1;
%Solución real en el intervalo dado
sol=vpasolve(f,x);
sol1=[];
j=1;
i=1;
c=numel(sol);
while j<=c
    if sol(j)>=x_0 && sol(j)<=x_1 
        sol1(i)=sol(j);
        i=i+1;
    end
    j=j+1;
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
fa=double(subs(f,x,x_0));
fb=double(subs(f,x,x_1));

if x_0~=x_1
    while n<=iterMax && Error > Tol
        y_0=double(subs(f,x,x_0));
        y_1=double(subs(f,x,x_1));
        x_2=(x_0*y_1-y_0*x_1)/(y_1-y_0);
        x_0=x_1;
        x_1=x_2;
        valm(n+1)=x_2;
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
else
    errordlg('Verifique que las aproximaciones iniciales dadas sean diferentes.','Error');
end            
end