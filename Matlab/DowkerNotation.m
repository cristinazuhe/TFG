
%la lectura de una trenza la tengo en prueba1. Una vez funciones este
%método, añado ese trozo de código y ale...
indices_braid = [1 2 3 1 2 ];
num_terms = length(indices_braid);

%Este será mi vector auxiliar para establecer pares/impares de cada crossing
vector_etiquetas = zeros(1,2*num_terms);

string = 1; siguiente_etiqueta = 1; tipocross = 0; cross = 1; string_encontrado = false;

%poner do-while a esto....
condicion = true;
while(condicion)
    string_encontrado = false;
    for i=cross:num_terms
        if( (abs(indices_braid(i)) == string) || (abs(indices_braid(i)) == (string-1)))
            string_encontrado = true;
            cross = i;
            break;
        end
    end

    if (string_encontrado == 0)
        for i=1:cross
           if( (abs(indices_braid(i)) == string) || (abs(indices_braid(i)) == (string-1)))
            string_encontrado = true;
            cross = i;
            break;
           end    
        end
    end

    vector_etiquetas(2*(cross-1) + mod(siguiente_etiqueta,2)+1) = siguiente_etiqueta;
    siguiente_etiqueta = siguiente_etiqueta +1;

    %falta lo del type para los signos....

    if ( abs(indices_braid(cross))== string)
        string = string+1;
    else
        string = string -1;
    end

    cross = cross + 1;
    condicion = (siguiente_etiqueta <= 2*num_terms);
end

%me quedo con los indices pares en el orden correcto. Sera la notación que
%buscamos
dowker = zeros(1,num_terms);
for i=1:num_terms
    for j=1:num_terms
        if(vector_etiquetas(2*j) == (2*i-1))
           dowker(i) = vector_etiquetas(2*j-1);
           break;
        end
    end
end
