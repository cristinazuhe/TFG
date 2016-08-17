indices_braid = [3 3 -1 4 2 1 1 2];

%elimino tantos movimientos de tipo1 como pueda -+simga +-simga
indices_braid = Simplifica(indices_braid);

%obtengo el indice de la trenza de menor valor 
minimo = min(abs(indices_braid));
%busco posiciones de handle con dicho indice
[pos1,pos2] = encuentra_handle(indices_braid, minimo);
if(pos1==0 && pos2==0)
    encontrado = false;
else
    entontrado = true;
end


if(encontrado)
    %Ahora ya tengo marcado con pos1 y pos2 el subvector con el que voy a hacer
    %la reduccion de dehornoy.

    %esta reduccion es para cuando ya tengo el handle en condiciones para
    %reducir. 
    nuevo = reduccion_base(indices_braid, minimo, pos1, pos2);
end


