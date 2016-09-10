indices_braid=[3 +4 2 ];

 for i=1:length(indices_braid)-1
    if(abs(abs(indices_braid(i)) - abs(indices_braid(i+1))) > 1)
        nueva_braid = zeros(1,length(indices_braid));
        for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
            if(j==i)
                nueva_braid(j) = indices_braid(j+1);
                nueva_braid(j+1) = indices_braid(j);
            elseif j~=(i+1)
                nueva_braid(j) = indices_braid(j);
            end
                
        end
        transicion_braids(indices_braid,nueva_braid, 20,0.5);     
    end
end
