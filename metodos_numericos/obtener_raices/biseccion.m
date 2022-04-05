function Resultados=biseccion(a,b,iterMax,Tol,f)
    syms x real;
    global sol1;
    %Solución real en el intervalo dado
    sol=vpasolve(f,x);
    sol1=[];
    j=1;
    i=1;
    c=numel(sol);
    while j<=c
        if sol(j)>=a && sol(j)<=b
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
    fa=double(subs(f,x,a));
    fb=double(subs(f,x,b));
    
    if fa*fb<0
        while n<=iterMax && Error > Tol
            m=(a+b)/2;
            fm=double(subs(f,x,m));
            if fa*fm<0
                b=m;
                fb=fm;
            else
                a=m;
                fa=fm;
            end
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
    else
        errordlg('Verifique que se cumple la condición de cambio de signo.','Error');
    end
end