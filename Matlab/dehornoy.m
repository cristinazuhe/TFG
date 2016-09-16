function es_trivial = dehornoy( indices_braid, representar, N_cortes, Radio)
    matriz_braid{1} = indices_braid;
    encontrado = true;
    while(encontrado)

            %elimino tantos movimientos de tipo1 como pueda -+sigma +-sigma
            [braid_aux, indices_braid,simplificado] = Simplifica(indices_braid);
            if(simplificado)
                 matriz_braid{length(matriz_braid)+1} = braid_aux;
            end
            
            if(~simplificado)
                    %obtengo el indice de la trenza de menor valor 
                    minimo = min(abs(indices_braid));
                    %busco posiciones de handle con dicho indice
                    [pos1,pos2] = encuentra_handle(indices_braid, minimo);
                    if(pos1==0 && pos2==0)
                        encontrado = false;
                    else
                        encontrado = true;
                    end

                    %Busco subhandle en el handle en cuestion para evitar que se produzcan
                    %ciclos infinitos. 
                    haysubhandle = true;
                    if(encontrado)
                        while(haysubhandle)
                           [pos1_sig, pos2_sig] = encuentra_handle(indices_braid(pos1+1:pos2-1),minimo+1);
                           if(pos1_sig~=0 && pos2_sig~=0)
                               pos2 = pos2_sig + pos1; pos1 = pos1_sig + pos1; minimo = minimo+1;
                               haysubhandle = true;
                           else
                               haysubhandle = false;
                           end
                        end
                        %Ahora ya tengo marcado con pos1 y pos2 el subvector con el que voy a hacer
                        %la reduccion de dehornoy.E sta reduccion es para cuando ya tengo el handle en condiciones para
                        %reducir. 
                        indices_braid = reduccion_base(indices_braid, minimo, pos1, pos2); 
                    end  
                    clearvars pos1_sig pos2_sig haysubhandle pos1 pos2 minimo
                    
            end
            
            %Creo una matriz con la secuencia de trenzas generada.
            if(~isequal(indices_braid,matriz_braid{length(matriz_braid)}))
                 matriz_braid{length(matriz_braid)+1} = indices_braid;
            end
            
    end
    
    
    %voy a representar los movimientos de las trenzas que llegan a
    %anularse:
    es_trivial = isequal([],matriz_braid{length(matriz_braid)});
    if(representar)
        if(es_trivial)
           for j=1:1:length(matriz_braid)-2
               hold off;
               transicion_braids(matriz_braid{j},matriz_braid{j+1},N_cortes,Radio);
           end
        end
    end
  
    
end
