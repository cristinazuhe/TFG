function [ ] = representar_braid2( indices_braid, N_cortes, Radio )
%REPRESENTAR_BRAID2
%Entrada: cadena de enteros que representa los cruces de una trenza, numero
%de cortes y radio de la trenza.
%Salida: representacion 3D de la trenza. 
%See also PARAM_CADENAS, TUBEP
    [matriz_x,matriz_y,matriz_z] = param_cadenas(indices_braid);
   
    for i=1:1:size(matriz_z,1)
        plot3(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:));
        tubep(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:),N_cortes,Radio);
        hold on;
    end
end

