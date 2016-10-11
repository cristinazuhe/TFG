%Probando y mejorando dowker
a = trenza([3 2 2 5 8]);
v_perm = perm(a);

indice = 1; auxiliar = 1;numero_enlaces = 0;seguir = true;

while(indice < length(v_perm))
    for i=1:1:length(v_perm)
        if(seguir)
           en_vector = v_perm(indice);
           if(sum(find(auxiliar==en_vector))~=0)
              seguir = false;
              numero_enlaces = numero_enlaces+1;
           else
              auxiliar(length(auxiliar)+1) = en_vector;
              indice= en_vector;
           end
        end
    end
    encontrado=false;
    for j=1:1:length(v_perm)
       if(~encontrado)
          if(sum(find(auxiliar==j))==0)
              indice = j; 
              encontrado=true;
              seguir = true;
          else
              indice=length(v_perm);
          end
       end
    end
end
