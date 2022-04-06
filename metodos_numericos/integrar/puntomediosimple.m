function Resultados=puntomediosimple(a,b,f)
    I=(b-a)*double(subs(f,x,(a+b)/2));
    y = a:0.01:b;
    c=numel(y);
    derivada=diff(f,x,2);
    for i =1:c
        derivadaevaluada=abs(double(subs(derivada,y(i))));
        if derivadaevaluada >=  derivadamaxima
            derivadamaxima=derivadaevaluada;
        end
    end
    Error=(derivadamaxima*(b-a)^3)/24;
    Resultados=[1,I,Error];
end