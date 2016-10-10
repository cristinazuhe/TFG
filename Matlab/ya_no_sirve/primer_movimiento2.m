indices_braid=[-1 +1 -3 +3];
encontrado = false;
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
            transicion_braids(indices_braid,braid_aux, 20,0.5);
            if(max(abs(braid_aux)) ~= 0)
                hold off;
                transicion_braids(braid_aux,nueva_braid, 20,0.5);
            end
        end
     end
end