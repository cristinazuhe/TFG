function [matriz_x1, matriz_y1, matriz_z1, matriz_x2, matriz_y2, matriz_z2] = aniade_cilindros( indices_braid1, matriz_x1, matriz_y1, matriz_z1, matriz_x2, matriz_y2, matriz_z2 )
%ANIADE_CILINDROS       
%Con esta funcion hago que las matrices de las trenzas (que se
%diferencian en ceros) tenga la misma dimension y la transicion de
%una trenza a otra se haga suavemente de forma que la visualizacion
%sea lo mejor posible. 
        
        dim_actual_2 = size(matriz_x2,2);
    
        %obtengo la cantidad de ceros y la posicion donde acaban los primeros ceros de la primera trenza.
        ceros=0;
        pos_primeros_ceros = 0;
        primero_fallido = false;
        for k=1:1:length(indices_braid1)
                if(indices_braid1(k)==0)
                    ceros = ceros+1;
               elseif(~primero_fallido)
                    primero_fallido = true;
                    pos_primeros_ceros = k;
               end
        end
        %obtengo la posicion donde empiezan los ultimos ceros de la primera trenza.
        pos_ultimos_ceros = 0;
        ultimo_fallido = false;
        for k=length(indices_braid1):-1:1
                if(indices_braid1(k)~=0 && ~ultimo_fallido)
                    ultimo_fallido = true;
                    pos_ultimos_ceros = k;
               end
        end

        primer0 = 0;
        contador = 0;
        while(size(matriz_x2,2)~= size(matriz_x1,2))
            contador = contador+1;
            %busco el siguiente 0 de la primera trenza.
            fin=false;
            for j=primer0+1:1:length(indices_braid1)
                if(indices_braid1(j)==0 && ~fin)
                   primer0 =j;
                   fin = true;
                end
            end

            %dependiendo de la posicion de los ceros en la trenza, tendremos
            %que hacer un movimiento u otro para que se vea claro.

            if (primer0 < pos_primeros_ceros) %primeros ceros
               for i=1:1:size(matriz_x2,1)
                  matriz_x2(i,(contador-1)*95 +(dim_actual_2)+1:(contador-1)*95 +(dim_actual_2)+95)= matriz_x2(i,(contador-1)*95 +(dim_actual_2)) ;
                  matriz_y2(i,(contador-1)*95 +(dim_actual_2)+1:(contador-1)*95 +(dim_actual_2)+95)= matriz_y2(i,(contador-1)*95 +(dim_actual_2)) ;
                  matriz_z2(i,(contador-1)*95 +(dim_actual_2)+1:(contador-1)*95 +(dim_actual_2)+95)= matriz_z2(i,(contador-1)*95 +(dim_actual_2)) ;
               end
            elseif(primer0 > pos_ultimos_ceros) %ultimos ceros
               auxx = []; auxy = []; auxz=[];
               for i=1:1:size(matriz_x2,1)
                     nuevox(i,1:95) = matriz_x2(i,1);
                     auxx = vertcat(auxx,[nuevox(i,:),matriz_x2(i,1:size(matriz_x2,2))]);

                     nuevoy(i,1:95) = matriz_y2(i,1);
                     auxy = vertcat(auxy,[nuevoy(i,:),matriz_y2(i,1:size(matriz_y2,2))]);

                     nuevoz(i,1:95) = matriz_z2(i,1);
                     auxz = vertcat(auxz,[nuevoz(i,:),matriz_z2(i,1:size(matriz_z2,2))]);
               end
               matriz_x2 = auxx;
               matriz_y2 = auxy;
               matriz_z2 = auxz;
            else
                auxx = []; auxy = []; auxz=[];
                for i=1:1:size(matriz_x2,1)
                      nuevox(i,1:95) = matriz_x2(i,95*(length(indices_braid1)-primer0- ceros +  contador)+1);
                      auxx = vertcat(auxx,[matriz_x2(i,1:95*(length(indices_braid1)-primer0- ceros+contador)),...
                                           nuevox(i,:),...
                                           matriz_x2(i,95*(length(indices_braid1)-primer0- ceros+contador)+1:size(matriz_x2,2))]);

                      nuevoy(i,1:95) = matriz_y2(i,95*(length(indices_braid1)-primer0- ceros+contador)+1);
                      auxy = vertcat(auxy,[matriz_y2(i,1:95*(length(indices_braid1)-primer0- ceros+contador)),...
                                           nuevoy(i,:),...
                                           matriz_y2(i,95*(length(indices_braid1)-primer0- ceros+contador)+1:size(matriz_y2,2))]);

                      nuevoz(i,1:95) = matriz_z2(i,95*(length(indices_braid1)-primer0- ceros+contador)+1);
                      auxz = vertcat(auxz,[matriz_z2(i,1:95*(length(indices_braid1)-primer0- ceros+contador)),...
                                          nuevoz(i,:)...
                                          matriz_z2(i,95*(length(indices_braid1)-primer0- ceros+contador)+1:size(matriz_z2,2))]);
                end
                matriz_x2 = auxx;
                matriz_y2 = auxy;
                matriz_z2 = auxz;
            end
        end

end

