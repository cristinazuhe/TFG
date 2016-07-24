function tp = giro_braid_neg(numero_braid, signo,inicio,fin,N_cortes,Radio)
if (fin-inicio == 3*pi)
    alpha=inicio:0.1:fin;
    l=zeros([1 length(alpha)]);

    y0=l;z0=alpha;
    x1=(signo)*cos(alpha)+numero_braid+1;y1=(signo)*sin(alpha);z1=alpha;
    y2=l;z2=alpha;
    if(mod(inicio,2) == 0)
        x0=l-signo+numero_braid+1;
        x2=l+signo+numero_braid+1;
    else
        x0=l+signo+numero_braid+1;
        x2=l-signo+numero_braid+1;
    end
    
    x = ((alpha>=inicio)&(alpha<=inicio+pi)).*x0 + ((alpha>=inicio+pi)&(alpha<=inicio+2*pi)).*x1...
        + ((alpha>=inicio+2*pi)&(alpha<=fin)).*x2;
    y = ((alpha>=inicio)&(alpha<=inicio+pi)).*y0 +((alpha>=inicio+pi)&(alpha<=inicio+2*pi)).*y1 +...
        ((alpha>=inicio+2*pi)&(alpha<=fin)).*y2;
    z = ((alpha>=inicio)&(alpha<=inicio+pi)).*z0 +((alpha>=inicio+pi)&(alpha<=inicio+2*pi)).*z1 +...
        ((alpha>=inicio+2*pi)&(alpha<=fin)).*z2;
    plot3(x, y, z);
    tp = tubep(x,y,z,N_cortes,Radio);
else 
    disp('ERROR: El intervalo (fin-inicio) tiene que ser de tamaño 3pi.');
end

