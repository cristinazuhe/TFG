function [pos1,pos2] = encuentra_handle( indices_braid, minimo )
    primero = true;
    encontrado = false;
    for i=1:length(indices_braid)
        if(~encontrado)
            if(primero)
                if(abs(indices_braid(i)) == minimo)
                    pos1 = i;
                    signo_anterior = sign(indices_braid(i));
                    primero = false;
                end
            else
                if(abs(indices_braid(i)) == minimo)
                    if(sign(indices_braid(i)) ~= signo_anterior)
                        pos2 = i;
                        encontrado = true;
                    else
                        pos1 = i;
                    end
                end
            end
        end
    end
    if(~encontrado)
        pos1=0; pos2=0;
    end


end

