indices_braid = [ 3 -2 -1 4 -2 1 3];

%elimino tantos movimientos de tipo1 como pueda -+simga +-simga
indices_braid = Simplifica(indices_braid);

%obtengo el indice de la trenza de menor valor 
minimo = min(abs(indices_braid));
%busco posiciones de hadle con dicho indice
primero = true;
encontrado = false;
for i=1:length(indices_braid)
    if(~encontrado)
        if(primero)
            if(abs(indices_braid(i)) == minimo)
                pos1 = i;
                signo_anterior = sign(indices_braid(i));
                primero = false;
            end
        else
            if(abs(indices_braid(i)) == minimo)
                if(sign(indices_braid(i)) ~= signo_anterior)
                    pos2 = i;
                    encontrado = true;
                else
                    pos1 = i;
                end
            end
        end
    end
end
if(~encontrado)
    clearvars pos1 pos2;
end
clearvars i primero signo_anterior;


%Ahora ya tengo marcado con pos1 y pos2 el subvector con el que voy a hacer
%la reduccion de dehornoy.
nuevo = reduccion_base(indices_braid, minimo, pos1, pos2);



