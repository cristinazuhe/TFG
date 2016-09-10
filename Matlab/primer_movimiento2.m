indices_braid=[-3 +3 +2];
 for i=1:length(indices_braid)-1
    if(indices_braid(i) + indices_braid(i+1) == 0)
        contador=1;
        nueva_braid= [];
        for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
            if(j~=i && j~=i+1)
            nueva_braid(contador) = indices_braid(j);
            contador= contador+1;
            end
        end
        transicion_braids(indices_braid,nueva_braid, 20,0.5);
    end
end