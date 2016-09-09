function dowker = DowkerNotation( indices_braid )
    num_terms = length(indices_braid);

    %Este será mi vector auxiliar para establecer pares/impares de cada crossing
    vector_etiquetas = zeros(1,2*num_terms);

    string = 1; siguiente_etiqueta = 1; tipocross = 0; cross = 1; 
    string_encontrado = false; condicion = true; signo = 1; link = false;

    while(condicion)
        string_encontrado = false;
        for i=cross:num_terms
            if( (abs(indices_braid(i)) == string) || (abs(indices_braid(i)) == (string-1)))
                string_encontrado = true;
                cross = i;
                break;
            end
        end

        if (~string_encontrado)
            for i=1:cross
               if( (abs(indices_braid(i)) == string) || (abs(indices_braid(i)) == (string-1)))
                string_encontrado = true;
                cross = i;
                break;
               end    
            end
        end

        if (vector_etiquetas(2*(cross-1) + mod(siguiente_etiqueta,2)+1))
            dowker = zeros(1,num_terms);
            condicion = false;
            link = true;
        else
            vector_etiquetas(2*(cross-1) + mod(siguiente_etiqueta,2)+1) = siguiente_etiqueta;
            siguiente_etiqueta = siguiente_etiqueta +1;

            if ((abs(indices_braid(cross)) == string && indices_braid(cross) * signo < 0) || ...
                (abs(indices_braid(cross)) ~= string && indices_braid(cross) * signo > 0))
                    if (mod(siguiente_etiqueta,2))
                        vector_etiquetas(2*cross-1) = -vector_etiquetas(2*cross-1);
                    end 
            end

            if ( abs(indices_braid(cross))== string)
                string = string +1;
            else
                string = string -1;
            end

            cross = cross + 1;
            condicion = (siguiente_etiqueta <= 2*num_terms);
        end
    end

    %me quedo con los indices pares en el orden correcto. Sera la notación que
    %buscamos
    if (~link)
        dowker = zeros(1,num_terms);
        for i=1:num_terms
            for j=1:num_terms
                if(vector_etiquetas(2*j) == (2*i-1))
                   dowker(i) = vector_etiquetas(2*j-1);
                   break;
                end
            end
        end
        salida = strcat('Su Dowker Notation es: ',num2str(dowker));
        disp(salida);
    else
        disp('Se trata de link');
    end


end

