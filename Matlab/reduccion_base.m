function [braid_aux2,nuevo,simplificado2] = reduccion_base( indices_braid, minimo, pos1, pos2 )
    braid_aux2 = [];
    vector = [];
    signo_anterior = sign(indices_braid(pos1));
    num_cambios = 0;
    for i=pos1+1:pos2-1
        if(abs(indices_braid(i)) == minimo+1)
            num_cambios = num_cambios+1;
            vector(end+1) = -1* (signo_anterior) * (minimo+1);
            vector(end+1) = sign(indices_braid(i))*(minimo);
            vector(end+1) = (signo_anterior) * (minimo+1);  
        else
            vector(end+1) = indices_braid(i);
        end
    end
    if(pos1~=1)
       nuevo = indices_braid(1:pos1-1);
    else
        nuevo=[];
    end
    nuevo = horzcat(nuevo,vector);
    if(pos2~=length(indices_braid))
       nuevo = horzcat(nuevo, indices_braid(pos2+1:length(indices_braid)));
    end
    
    
    simplificado2 = false;
    if(num_cambios>1)
       simplificado2 = true;
    end
    
    contador =0;
    if(simplificado2)
        for i=1:1:length(indices_braid)
            if( i < pos1+1)
                braid_aux2(end+1)=indices_braid(i);
            elseif (i>pos1 && i<pos2)
                if(abs(indices_braid(i)) == minimo+1) %si tengo un cruce un valor mayor, tendre que aniadir 0s 
                    if(contador == num_cambios-1)
                        braid_aux2(end+1) = 0;
                        braid_aux2(end+1) = indices_braid(i);
                    elseif(contador == 0)
                        braid_aux2(end+1) = indices_braid(i);
                        braid_aux2(end+1) = 0;
                    else
                        braid_aux2(end+1) = 0;
                        braid_aux2(end+1) = indices_braid(i);
                        braid_aux2(end+1) = 0;
                    end
                    contador= contador+1;
                else
                    braid_aux2(end+1) = indices_braid(i);
                end
            elseif(i<pos2+1)
                braid_aux2(end+1) = indices_braid(i);
            end
        end
    end


end

