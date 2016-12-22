function representar_braid(indices_braid, N_cortes, Radio )
    n_total_braid = max(abs(indices_braid))+1;
    contador=0;
    inicio = -3*pi;
    fin = 0;
    for i=1:length(indices_braid)
        cruce = indices_braid(i);

        for j=1:abs(cruce)-1
            cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
        end
        if(cruce > 0)
            braid_neg(abs(cruce)+contador,inicio,fin,N_cortes,Radio); 
            hold on;
        else   
            braid_pos(abs(cruce)+contador,inicio,fin,N_cortes,Radio);
            hold on;
        end
        contador = contador +3;

        for j=abs(cruce)+1:n_total_braid-1
            cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end


end

