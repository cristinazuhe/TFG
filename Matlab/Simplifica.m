function nueva_braid = Simplifica( indices_braid )
    nueva_braid = indices_braid;
    repite = true;
    while(repite == true && ~isempty(indices_braid))
            for i=1:length(indices_braid)-1
               if(indices_braid(i) + indices_braid(i+1) == 0)
                    nueva_braid = zeros(1,length(indices_braid)-2);
                    contador=1;
                    repite = true;
                    for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
                        if(j~=i && j~=i+1)
                        nueva_braid(contador) = indices_braid(j);
                        contador= contador+1;
                        end
                    end
                    break;
               else
                   repite = false;
               end
            end
        indices_braid = nueva_braid;
    end
end

