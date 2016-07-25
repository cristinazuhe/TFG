function  [p1,p2] = braid_neg(numero_braid,inicio,fin,N_cortes,Radio)
%if (fin-inicio) == (3*pi)
   p1 = giro_braid_neg(numero_braid,1,inicio,fin,N_cortes,Radio); %1--> de 0 a 2. 2 --> 1 a 3...
   hold on;
   p2 = giro_braid_neg(numero_braid,-1,inicio,fin,N_cortes,Radio);
%else 
%    disp('ERROR: El intervalo (fin-inicio) tiene que ser de tamaño 3pi.');
end

