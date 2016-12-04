function cilindro_braid(numero_cadena, inicio,fin,N_cortes,Radio)
%if (fin-inicio == 3*pi)
    alpha=inicio:0.1:fin;
    l=zeros([1 length(alpha)]);

    x0=l+numero_cadena;y0=l;z0=alpha;
    
    x = ((alpha>=inicio)&(alpha<=fin)).*x0 ;
    y = ((alpha>=inicio)&(alpha<=fin)).*y0;
    z = ((alpha>=inicio)&(alpha<=fin)).*z0;
    plot3(x, y, z);
    tubep(x,y,z,N_cortes,Radio);
%else 
%    disp('ERROR: El intervalo (fin-inicio) tiene que ser de tamaño 3pi.');
end
