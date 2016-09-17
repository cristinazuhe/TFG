function [ indices_braid ] = leer_trenza( )
    braid_cad_char = input('Inserte braid (ej: +s2-s1+s1) ','s');
    n_aux_cruces=1;
    indices_braid = zeros(1,length(braid_cad_char)/3);
    for i=1:length(braid_cad_char)
        if(strcmpi(braid_cad_char(i),'-'))
           indices_braid(n_aux_cruces) = -str2double(braid_cad_char(i+2));
           n_aux_cruces = n_aux_cruces+1;
        elseif(strcmpi(braid_cad_char(i),'+'))
           indices_braid(n_aux_cruces) = str2double(braid_cad_char(i+2));
           n_aux_cruces = n_aux_cruces+1;
        end
    end


end

