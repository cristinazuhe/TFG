function  [p1,p2] = braid_pos(numero_braid,inicio,fin,N_cortes,Radio)
   p1 = giro_braid_pos(numero_braid,1,inicio,fin,N_cortes,Radio); %1--> de 0 a 2. 2 --> 1 a 3...
   hold on;
   p2 = giro_braid_pos(numero_braid,-1,inicio,fin,N_cortes,Radio);
end
