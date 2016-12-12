function braid_pos(numero_cadena,inicio,fin,N_cortes,Radio)
%if (fin-inicio == 3*pi)
   giro_braid_pos(numero_cadena,1,inicio,fin,N_cortes,Radio); %1--> de 0 a 2. 2 --> 1 a 3...
   hold on;
   giro_braid_pos(numero_cadena,-1,inicio,fin,N_cortes,Radio);
   
%else 
%    disp('ERROR: El intervalo (fin-inicio) tiene que ser de tamaño 3pi.');
end
