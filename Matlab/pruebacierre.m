alpha=0:0.01:pi;
l=zeros([1 length(alpha)]);
    
x=-cos(alpha)-1;y=l;z=-sin(alpha);

plot3(x,y,z);
tubep(x,y,z,20,0.5);
hold on;


plot3(3*x+2,3*y,2*z);
tubep(3*x+2,3*y,2*z,20,0.5);


plot3(5*x+4,5*y,3*z);
tubep(5*x+4,5*y,3*z,20,0.5);
a=trenza([2]);
representar_trenza(a);

[x_cil,y_cil,z_cil] = cilindro_base();
plot3(x_cil-2,y_cil,z_cil);
tubep(x_cil-2,y_cil,z_cil,20,0.5);


x1 = x_cil-4; y1 = y_cil; z1 = z_cil;  
plot3(x1,y1,z1);
tubep(x1,y1,z1,20,0.5);