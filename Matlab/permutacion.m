function vector_p = permutacion( indices_braid )
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

end

