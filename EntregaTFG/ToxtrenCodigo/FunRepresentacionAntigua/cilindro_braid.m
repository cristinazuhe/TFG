function cilindro_braid(numero_cadena, inicio,fin,N_cortes,Radio)
%if (fin-inicio == 3*pi)
    alpha=inicio:0.1:fin;
    l=zeros([1 length(alpha)]);

    x=l+numero_cadena;y=l;z=alpha;
    plot3(x, y, z);
    tubep(x,y,z,N_cortes,Radio);
%else 
%    disp('ERROR: El intervalo (fin-inicio) tiene que ser de tamaño 3pi.');
end
