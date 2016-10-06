function [es_trivial, final_braid] = dehornoy( indices_braid, representar, N_cortes, Radio)
%DEHORNOY 
%Entrada: cadena de enteros que representa los cruces de una trenza, bool
%para representar o no las transformaciones, n�mero de cortes y radio del
%tubo de la trenza. 
%Salida: bool que indica si la trenza es trivial y reducci�n dehornoy de la
%trenza. 
%See also SIMPLIFICA, ENCUENTRA_HANDLE, REDUCCION_BASE, TRANSICION_BRAIDS
    matriz_braid{1} = indices_braid;
    encontrado = true;
    while(encontrado)

            %elimino movimiento de tipo1 como pueda -+sigma +-sigma
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
                        %en braid_aux tengo una trenza auxiliar con ceros
                        %para facilitar la visualizacion
                        [braid_aux2,indices_braid, simplificado2] = reduccion_base(indices_braid, minimo, pos1, pos2); 
                        if(simplificado2)
                                 matriz_braid{length(matriz_braid)+1} = braid_aux2;
                        end
                    end  
                    clearvars pos1_sig pos2_sig haysubhandle pos1 pos2 minimo
                    
            end
            
            %Creo una matriz con la secuencia de trenzas generada.
            if(~isequal(indices_braid,matriz_braid{length(matriz_braid)}))
                 matriz_braid{length(matriz_braid)+1} = indices_braid;
            end
            
    end
    
    
    final_braid = matriz_braid{length(matriz_braid)};
    %voy a representar los movimientos de las trenzas
    es_trivial = isequal([],matriz_braid{length(matriz_braid)});
    if(representar)
        if(es_trivial)
           for j=1:1:length(matriz_braid)-2
               hold off;
               transicion_braids(matriz_braid{j},matriz_braid{j+1},N_cortes,Radio);
           end
        else
           for j=1:1:length(matriz_braid)-1
               hold off;
               transicion_braids(matriz_braid{j},matriz_braid{j+1},N_cortes,Radio);
           end
        end
    end
  
end
