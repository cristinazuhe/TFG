indices_braid=[-3 -2 +1 +2];

 for i=1:length(indices_braid)-2
    if((indices_braid(i)*indices_braid(i+1) > 0) || (indices_braid(i+1)*indices_braid(i+2) > 0))%necesito que los signos sean iguales.
        if(abs(indices_braid(i)) == abs(indices_braid(i+2)))
            nueva_braid = zeros(1,length(indices_braid));
            for j=1:length(indices_braid)  
                if(j==i)
                    nueva_braid(j) = sign(indices_braid(j+2))*abs(indices_braid(j+1));
                    nueva_braid(j+1) = sign(indices_braid(j+1))*abs(indices_braid(j));
                    nueva_braid(j+2) = sign(indices_braid(j))*abs(indices_braid(j+1));
                elseif (j~=(i+1) && j~=(i+2))
                    nueva_braid(j) = indices_braid(j);
                end

            end
            transicion_braids(indices_braid,nueva_braid, 20,0.5);

        end
    end
end
