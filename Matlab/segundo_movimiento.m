indices_braid=[4 -2 -1 -2 5];

 for i=1:length(indices_braid)-2
    if(indices_braid(i)*indices_braid(i+1) > 0) %necesito que los signos sean iguales.
        if(indices_braid(i) == (indices_braid(i+2)))
            nueva_braid = zeros(1,length(indices_braid));
            for j=1:length(indices_braid)  
                if(j==i)
                    nueva_braid(j) = indices_braid(j+1);
                    nueva_braid(j+1) = indices_braid(j);
                    nueva_braid(j+2) = indices_braid(j+1);
                elseif (j~=(i+1) && j~=(i+2))
                    nueva_braid(j) = indices_braid(j);
                end

            end
            representar_segundo_movimiento(indices_braid,20,0.7, i); 

        end
    end
end
