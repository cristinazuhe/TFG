function [p0,p1,p2,p3 ] = representar_braid(indices_braid, N_cortes, Radio )
    n_total_braid = max(abs(indices_braid))+1;
    contador=0;
    inicio = -3*pi;
    fin = 0;
    for i=1:length(indices_braid)
        cruce = indices_braid(i);

        for j=1:abs(cruce)-1
            p0 = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
        end
        if(cruce > 0)
            [p1,p2] = braid_neg(abs(cruce)+contador,inicio,fin,N_cortes,Radio); 
            hold on;
        else   
            [p1,p2] = braid_pos(abs(cruce)+contador,inicio,fin,N_cortes,Radio);
            hold on;
        end
        contador = contador +3;

        for j=abs(cruce)+1:n_total_braid-1
            p3 = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end


end

