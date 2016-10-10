function valor_exp = exponente( indices_braid )
%EXPONENTE
%Entrada: cadena de enteros que representa los cruces de una trenza.
%Salida: exponente de la trenza. 
    valor_exp=0;
    for i=1:1:length(indices_braid)
       valor_exp = valor_exp + sign(indices_braid(i)); 
    end

end

