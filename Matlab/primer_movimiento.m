indices_braid=[ 3 -3 5];

 for i=1:length(indices_braid)-1
    if(indices_braid(i) + indices_braid(i+1) == 0)
        nueva_braid = zeros(1,length(indices_braid)-2);
        contador=1;
        for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
            if(j~=i && j~=i+1)
            nueva_braid(contador) = indices_braid(j);
            contador= contador+1;
            end
        end
        representar_primer_movimiento(indices_braid,20,0.7, i); %represento toda la trenza menos los crossing i,i+1 a borrar
        hold off;
        representar_braid(nueva_braid,20,0.7); 
           
    end
end
