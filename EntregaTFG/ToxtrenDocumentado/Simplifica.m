function [braid_aux, nueva_braid,encontrado] = Simplifica( indices_braid )
%SIMPLIFICA
%ENTRADA: cadena de enteros que representa los cruces de una trenza.
%SALIDA: trenza libremente reducida de la trenza de entrada. 
     encontrado = false;
     nueva_braid =indices_braid;
     braid_aux = [];
     for i=1:length(indices_braid)-1
         if(~encontrado)
            if(indices_braid(i) + indices_braid(i+1) == 0)
                encontrado = true;
                contador=1;
                nueva_braid = [];
                braid_aux = indices_braid;
                for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
                    if(j~=i && j~=i+1)
                        nueva_braid(contador) = indices_braid(j);
                        contador= contador+1;
                    else
                        braid_aux(j)=0;    
                    end
                end
            end
         end         
    end
end