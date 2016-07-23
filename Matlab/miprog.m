%Programa para hallar la suma de los ángulos internos de un polígono
%regular:

%funcion input
num_lados = input('Ingrese el numero de lados: ');
s=180*(num_lados-2);
disp('La suma de los ángulos internos del poligono es: ');
disp(s);

%bloque if-elseif
a=2;
b=3;
c=4;
if(a<b && b>=c)
    j=1;
elseif (a<b && b<c)
    j=-1;
    k=9;
end


%switch-case
operacion =2;
switch operacion
    case 1
        r=a + b;
    case 2
        r=a*b;
    otherwise
        r=2;
end


%bucle for
v=[1,4,7,10];
for j=1:2:4
    v(j)  = j;
end

matriz = zeros(3,4);
for i=1:3
    for j=1:4
        matriz(i,j)=i*j;
    end
end


    
