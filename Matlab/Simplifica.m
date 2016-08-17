function indices_braid = Simplifica( indices_braid )
    encontrado = false;
    repite = true;
    if(length(indices_braid)<2)
        repite = false;
    end
    while(repite == true && length(indices_braid)>1)
            encontrado = false;
            repite = true;
            if(length(indices_braid)<2)
                repite = false;
            end
            for i=1:length(indices_braid)-1
                if(~encontrado)
                   if(indices_braid(i) + indices_braid(i+1) == 0)
                        nueva_braid = zeros(1,length(indices_braid)-2);
                        contador=1;
                        encontrado = true;
                        repite = true;
                        for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
                            if(j~=i && j~=i+1)
                            nueva_braid(contador) = indices_braid(j);
                            contador= contador+1;
                            end
                        end
                   else
                       repite = false;
                       encontrado = false;
                   end
                end
            end
            if(encontrado)
                indices_braid = nueva_braid;
            end 
    end
end