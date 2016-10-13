
a=trenza([4 -2 -6 +2]);
representar_trenza(a);

%Cierres superiores
alpha=0:0.01:pi;
l=zeros([1 length(alpha)]);
x_cierre=cos(alpha)-1;y_cierre=l;z_cierre=sin(alpha);
contador=1; distancia=0;
for i=1:1:a.get_n
    x_cierre_n = contador*x_cierre + distancia; y_cierre_n = contador*y_cierre; z_cierre_n = i*z_cierre +3*pi;
    plot3(x_cierre_n,y_cierre_n,z_cierre_n);
    tubep(x_cierre_n,y_cierre_n,z_cierre_n,20,0.5);
    contador=contador+2;
    distancia=distancia+2;
end

%Cilindros de los cierres
 [x_cil,y_cil,z_cil] = cilindro_base();
 distancia = 2;
 limite = length(a.get_indices)-1;
 for i=1:1:a.get_n
     x_cil_n = x_cil - distancia;
     for j=0:1:limite
        plot3(x_cil_n,y_cil,z_cil-j*(3*pi));
        tubep(x_cil_n,y_cil,z_cil-j*(3*pi),20,0.5);
     end
     distancia = distancia+2;
 end
 
%Cierres inferiores
alpha=0:0.01:pi;
l=zeros([1 length(alpha)]);
x_cierre=-cos(alpha)-1;y_cierre=l;z_cierre=-sin(alpha);
contador=1; distancia=0;
for i=1:1:a.get_n
    x_cierre_n = contador*x_cierre + distancia; y_cierre_n = contador*y_cierre; z_cierre_n = i*z_cierre -limite*(3*pi);
    plot3(x_cierre_n,y_cierre_n,z_cierre_n);
    tubep(x_cierre_n,y_cierre_n,z_cierre_n,20,0.5);
    contador=contador+2;
    distancia=distancia+2;
end
  