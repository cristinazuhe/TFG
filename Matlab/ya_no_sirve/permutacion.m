function vector_p = permutacion( indices_braid, n )
%PERMUTACION
%Entrada: cadena de enteros que representa los cruces de una trenza y
%numero de cadenas de la trenza. 
%Salida: permutacion de la trenza. 
    maximo = max(abs(indices_braid))+1;
    vector_p = 1:maximo;
    for i=1:1:length(indices_braid)
       for j=1:1:maximo
          if(abs(indices_braid(i)) == vector_p(j))
                vector_p(j) = vector_p(j)+1;
          elseif (abs(indices_braid(i)) == (vector_p(j)-1))
                vector_p(j) = vector_p(j)-1;
          end
       end
    end
    
    for j=maximo+1:1:n
        vector_p(j) = j;
    end
end

