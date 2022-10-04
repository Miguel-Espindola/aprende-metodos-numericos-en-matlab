function Resultados=puntomediosimple(a,b,f)
%esta función calcula la integral de una función en un intervalo de a,b la
%entrada es una función simbólica y el intervalo en donde se desea integrar

    vars = symvar(f);
    I=(b-a)*double(subs(f,vars(1),(a+b)/2));
    y = a:0.01:b;
    c=numel(y);
    derivada=diff(f,vars(1),2);
    derivadamaxima=0;
    %derivadamaxima = [];

    for i =1:c
        derivadaevaluada=abs(double(subs(derivada,y(i))))
        if derivadaevaluada >=  derivadamaxima
            derivadamaxima=derivadaevaluada;
        end
    end
    Error=(derivadamaxima*(b-a)^3)/24;
    Resultados=[1,I,Error];
end