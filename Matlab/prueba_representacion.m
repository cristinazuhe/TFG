N_cortes = 20;
Radio = 0.5;
indices_braid=[ -2 -1 +2 +1 +2 -1];
indices_partida= indices_braid;

dim_max = length(indices_partida);
matriz_braid = indices_partida;
encontrado = true;
    while(encontrado)

            %elimino tantos movimientos de tipo1 como pueda -+simga +-simga
            indices_braid = Simplifica(indices_braid);

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
            %Creo una matriz con la secuencia de trenzas generada.
            aux_braid = indices_braid;
            if(length(indices_braid) < dim_max)
                aux_braid(size(aux_braid,2)+1:dim_max) = 0;
            elseif(length(indices_braid) > dim_max)
                dim_max = length(indices_braid);
                tam = size(matriz_braid,2);
                for i=tam+1:1:length(indices_braid)
                   for j=1:1:size(matriz_braid,1)
                      matriz_braid(j,i) = 0; 
                   end
                end
            end
            if(~isequal(aux_braid,matriz_braid(size(matriz_braid,1),:)))
                matriz_braid = [matriz_braid; aux_braid];
            end
    end
    
    
    %voy a representar los movimientos de las trenzas que llegan a
    %anularse:
    if(matriz_braid(size(matriz_braid,1),:) == 0)
       for j=1:1:size(matriz_braid,1)-1
           transicion_braids(matriz_braid(j,:),matriz_braid(j+1,:),20,0.5);
       end
    end