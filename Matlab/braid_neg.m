function  [p1,plt1,x1,y1,z1,x1_cil, y1_cil, z1_cil, p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = braid_neg(numero_braid,inicio,fin,N_cortes,Radio)
%if (fin-inicio) == (3*pi)
   [p1,plt1,x1,y1,z1,x1_cil,y1_cil,z1_cil] = giro_braid_neg(numero_braid,1,inicio,fin,N_cortes,Radio); %1--> de 0 a 2. 2 --> 1 a 3...
   hold on;
   [p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = giro_braid_neg(numero_braid,-1,inicio,fin,N_cortes,Radio);
%else 
%    disp('ERROR: El intervalo (fin-inicio) tiene que ser de tamaño 3pi.');
end

