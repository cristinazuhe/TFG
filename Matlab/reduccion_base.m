function nuevo = reduccion_base( indices_braid, minimo, pos1, pos2 )
    vector = [];
    signo_anterior = sign(indices_braid(pos1));
    for i=pos1+1:pos2-1
        if(abs(indices_braid(i)) == minimo+1)
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


end

