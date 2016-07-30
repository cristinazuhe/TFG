indices_braid=[-2 -3 -1];

 for i=1:length(indices_braid)-1
    if(abs(abs(indices_braid(i)) - abs(indices_braid(i+1))) > 1)
        nueva_braid = zeros(1,length(indices_braid)-2);
        for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
            if(j==i)
                nueva_braid(j) = indices_braid(j+1);
                nueva_braid(j+1) = indices_braid(j);
            elseif j~=(i+1)
                nueva_braid(j) = indices_braid(j);
            end
                
        end
        representar_tercer_movimiento(indices_braid,20,0.7, i); %represento toda la trenza menos los crossing i,i+1 a borrar
           
    end
end
