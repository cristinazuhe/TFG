function [ a2,equi ] = MV1( br_c, completo )
    if(nargin ==1)
        completo = false;
    end
    equi = 2;
    m=max(abs(br_c.get_indices));
    aux = br_c.get_indices;
    apariciones = find(abs(aux)==m);
    l = length(aux);
    if(aux(1)+aux(l) ==0)
        aux(l)=[];aux(1)=[];   
        if(length(aux)==1)
           equi = 1;
           return;
        end
    else
        if(completo)
            if(apariciones(1)<=l/2)
               aux = [-aux(1),aux];
               aux(end+1)=-aux(1);
            else
               aux = [aux(end),aux];
               aux(end+1) = -aux(1);
            end
        end
    end
    a2 = trenza_cerrada(aux);
end

