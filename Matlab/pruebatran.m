clear all;
N_cortes = 20;
Radio = 0.5;
indices_braid1 = [5 3 3 -2];
indices_braid2=[0 5 0 3 0 0 3 -2 0];


  %Obtenemos las parametrizaciones de las cuerdas.
    [matriz_x1,matriz_y1,matriz_z1] = param_cadenas(indices_braid1);
    [matriz_x2,matriz_y2,matriz_z2] = param_cadenas(indices_braid2);

    %Si las trenzas tienen distinto numero de cruces, tenemos que tener la
    %misma dimension en las matrices.
    dim_actual_2 = size(matriz_x2,2);
    dim_actual_1 = size(matriz_x1,2);

    %Si eliminamos cilindros (ceros en la primera trenza)...
    if(size(matriz_x1,2) > size(matriz_x2,2))
        %busco el primer 0 de la primera trenza.
        fin=false;
        for j=1:1:length(indices_braid1)
            if(indices_braid1(j)==0 && ~fin)
               primer0 =j;
               fin = true;
            end
        end
        %dependiendo de la posici�n de los ceros en la trenza, tendremos
        %que hacer un movimiento u otro para que se vea claro.
        if(fin)
          if(indices_braid2(primer0+1)==0)
            if(primer0 > 1 && (primer0 +1 == length(indices_braid1)))
                dips('1');
               auxx = []; auxy = []; auxz=[];
               for i=1:1:size(matriz_x2,1)
                     nuevox(i,1:190) = matriz_x2(i,1);
                     auxx = vertcat(auxx,[nuevox(i,:),matriz_x2(i,1:size(matriz_x2,2))]);

                     nuevoy(i,1:190) = matriz_y2(i,1);
                     auxy = vertcat(auxy,[nuevoy(i,:),matriz_y2(i,1:size(matriz_y2,2))]);

                     nuevoz(i,1:190) = matriz_z2(i,1);
                     auxz = vertcat(auxz,[nuevoz(i,:),matriz_z2(i,1:size(matriz_z2,2))]);
               end
               matriz_x2 = auxx;
               matriz_y2 = auxy;
               matriz_z2 = auxz;
            elseif (primer0 ==1)
                dips('2');
               for i=1:1:size(matriz_x2,1)
                  matriz_x2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_x2(i,dim_actual_2) ;
                  matriz_y2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_y2(i,dim_actual_2) ;
                  matriz_z2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_z2(i,dim_actual_2) ;
               end
            else
                dips('3');
                auxx = []; auxy = []; auxz=[];
                for i=1:1:size(matriz_x2,1)
                      nuevox(i,1:190) = matriz_x2(i,95*(length(indices_braid1)-primer0-1)+1);
                      auxx = vertcat(auxx,[matriz_x2(i,1:95*(length(indices_braid1)-primer0-1)),nuevox(i,:),...
                                           matriz_x2(i,95*(length(indices_braid1)-primer0-1)+1:size(matriz_x2,2))]);

                      nuevoy(i,1:190) = matriz_y2(i,95*(length(indices_braid1)-primer0-1)+1);
                      auxy = vertcat(auxy,[matriz_y2(i,1:95*(length(indices_braid1)-primer0-1)),nuevoy(i,:),...
                                           matriz_y2(i,95*(length(indices_braid1)-primer0-1)+1:size(matriz_y2,2))]);

                      nuevoz(i,1:190) = matriz_z2(i,95*(length(indices_braid1)-primer0-1)+1);
                      auxz = vertcat(auxz,[matriz_z2(i,1:95*(length(indices_braid1)-primer0-1)),nuevoz(i,:)...
                                          matriz_z2(i,95*(length(indices_braid1)-primer0-1)+1:size(matriz_z2,2))]);
                end
                matriz_x2 = auxx;
                matriz_y2 = auxy;
                matriz_z2 = auxz;
            end
        else %esta transicion no se ve clara...
                dips('4');
               for i=1:1:size(matriz_x2,1)
                  matriz_x2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_x2(i,dim_actual_2) ;
                  matriz_y2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_y2(i,dim_actual_2) ;
                  matriz_z2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_z2(i,dim_actual_2) ;
               end
        end
      end

    %Si aniadimos cilindros a la segunda trenza....
    elseif (size(matriz_x1,2) < size(matriz_x2,2))
        %obtengo la cantidad de ceros y la posicion donde acaban los primeros ceros de la segunda trenza.
        ceros=0;
        pos_primeros_ceros = 0;
        primero_fallido = false;
        for k=1:1:length(indices_braid2)
                if(indices_braid2(k)==0)
                    ceros = ceros+1;
               elseif(~primero_fallido)
                    primero_fallido = true;
                    pos_primeros_ceros = k;
               end
        end
        %obtengo la posición donde empiezan los ultimos ceros de la segunda trenza.
        pos_ultimos_ceros = 0;
        ultimo_fallido = false;
        for k=length(indices_braid2):-1:1
                if(indices_braid2(k)~=0 && ~ultimo_fallido)
                    ultimo_fallido = true;
                    pos_ultimos_ceros = k;
               end
        end

        primer0 = 0;
        contador = 0;

        while(size(matriz_x1,2)~= size(matriz_x2,2))
            contador = contador+1;
            %busco el siguiente 0 de la segunda trenza.
            fin=false;
            for j=primer0+1:1:length(indices_braid2)
                if(indices_braid2(j)==0 && ~fin)
                   primer0 =j;
                   fin = true;
                end
            end
                disp('contador');
                disp(contador);
            if(fin)
                %dependiendo de la posicion de los ceros en la trenza, tendremos
                %que hacer un movimiento u otro para que se vea claro.

                if (primer0 < pos_primeros_ceros) %primeros ceros
                    disp('1');
                   for i=1:1:size(matriz_x1,1)
                      matriz_x1(i,(contador-1)*95 +(dim_actual_1)+1:(contador-1)*95 +(dim_actual_1)+95)= matriz_x1(i,(contador-1)*95 +(dim_actual_1)) ;
                      matriz_y1(i,(contador-1)*95 +(dim_actual_1)+1:(contador-1)*95 +(dim_actual_1)+95)= matriz_y1(i,(contador-1)*95 +(dim_actual_1)) ;
                      matriz_z1(i,(contador-1)*95 +(dim_actual_1)+1:(contador-1)*95 +(dim_actual_1)+95)= matriz_z1(i,(contador-1)*95 +(dim_actual_1)) ;
                   end
                elseif(primer0 > pos_ultimos_ceros) %ultimos ceros
                   disp('2');
                   auxx = []; auxy = []; auxz=[];
                   for i=1:1:size(matriz_x1,1)
                         nuevox(i,1:95) = matriz_x1(i,1);
                         auxx = vertcat(auxx,[nuevox(i,:),matriz_x1(i,1:size(matriz_x1,2))]);

                         nuevoy(i,1:95) = matriz_y1(i,1);
                         auxy = vertcat(auxy,[nuevoy(i,:),matriz_y1(i,1:size(matriz_y1,2))]);

                         nuevoz(i,1:95) = matriz_z1(i,1);
                         auxz = vertcat(auxz,[nuevoz(i,:),matriz_z1(i,1:size(matriz_z1,2))]);
                   end
                   matriz_x1 = auxx;
                   matriz_y1 = auxy;
                   matriz_z1 = auxz;
                else
                    disp('3');
                    auxx = []; auxy = []; auxz=[];
                    for i=1:1:size(matriz_x1,1)
                          nuevox(i,1:95) = matriz_x1(i,95*(length(indices_braid2)-primer0- ceros +  contador)+1);
                          auxx = vertcat(auxx,[matriz_x1(i,1:95*(length(indices_braid2)-primer0- ceros+contador)),...
                                               nuevox(i,:),...
                                               matriz_x1(i,95*(length(indices_braid2)-primer0- ceros+contador)+1:size(matriz_x1,2))]);

                          nuevoy(i,1:95) = matriz_y1(i,95*(length(indices_braid2)-primer0- ceros+contador)+1);
                          auxy = vertcat(auxy,[matriz_y1(i,1:95*(length(indices_braid2)-primer0- ceros+contador)),...
                                               nuevoy(i,:),...
                                               matriz_y1(i,95*(length(indices_braid2)-primer0- ceros+contador)+1:size(matriz_y1,2))]);

                          nuevoz(i,1:95) = matriz_z1(i,95*(length(indices_braid2)-primer0- ceros+contador)+1);
                          auxz = vertcat(auxz,[matriz_z1(i,1:95*(length(indices_braid2)-primer0- ceros+contador)),...
                                              nuevoz(i,:)...
                                              matriz_z1(i,95*(length(indices_braid2)-primer0- ceros+contador)+1:size(matriz_z1,2))]);
                    end
                    matriz_x1 = auxx;
                    matriz_y1 = auxy;
                    matriz_z1 = auxz;
                end
            else %esta transicion no se ve clara....
                disp('aqui');
                  for i=1:1:size(matriz_x1,1)
                      matriz_x1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_x1(i,dim_actual_1) ;
                      matriz_y1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_y1(i,dim_actual_1) ;
                      matriz_z1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_z1(i,dim_actual_1) ;
                   end
            end
        end

    end


    %Si eliminamos trenzas, tendremos que tener el mismo tamanio de
    %matrices.
    if(size(matriz_x1,1) > size(matriz_x2,1))
       for i=size(matriz_x2,1)+1:1:size(matriz_x1,1)
          matriz_x2(i,1:size(matriz_x1,2))= matriz_x1(i,size(matriz_x1,2)) ;
          matriz_y2(i,1:size(matriz_x1,2))= matriz_y1(i,size(matriz_y1,2)) ;
          matriz_z2(i,1:size(matriz_x1,2))= matriz_z1(i,1:size(matriz_z1,2)) ;
       end
       if(size(indices_braid2)==0)
            matriz_x2(1,1:size(matriz_x1,2))= matriz_x1(1,size(matriz_x1,2)) ;
            matriz_y2(1,1:size(matriz_x1,2))= matriz_y1(1,size(matriz_y1,2)) ;
            matriz_z2(1,1:size(matriz_x1,2))= matriz_z1(1,1:size(matriz_z1,2)) ;
        end
     elseif (size(matriz_x1,1) < size(matriz_x2,1))
        for i=size(matriz_x1,1)+1:1:size(matriz_x2,1)
            matriz_x1(i,1:size(matriz_x2,2))= matriz_x2(i,size(matriz_x2,2)) ;
            matriz_y1(i,1:size(matriz_x2,2))= matriz_y2(i,size(matriz_y2,2)) ;
            matriz_z1(i,1:size(matriz_x2,2))= matriz_z2(i,1:size(matriz_z2,2)) ;
        end
        if(size(indices_braid1)==0)
            matriz_x1(1,1:size(matriz_x2,2))= matriz_x2(1,size(matriz_x2,2)) ;
            matriz_y1(1,1:size(matriz_x2,2))= matriz_y2(1,size(matriz_y2,2)) ;
            matriz_z1(1,1:size(matriz_x2,2))= matriz_z2(1,size(matriz_z2,2)) ;
        end
    end



    %Representamos el movimiento de las dos trenzas.
    for t=0:0.1:1
        for j=1:1:size(matriz_x1,1)
            x_tran = (1-t)*matriz_x1(j,:) + (t)*matriz_x2(j,:);
            y_tran = (1-t)*matriz_y1(j,:) + (t)*matriz_y2(j,:);
            z_tran = (1-t)*matriz_z1(j,:) + (t)*matriz_z2(j,:);
            if j==1
                aux1 = plot3(x_tran, y_tran, z_tran);
                aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
                hold on;
            else
                aux1 = vertcat(aux1, plot3(x_tran, y_tran, z_tran));
                aux2 = vertcat(aux2, tubep(x_tran,y_tran,z_tran,N_cortes,Radio));
            end
        end

        pause(0.1);
        if(t~=1)
            delete(aux1);delete(aux2);
            clear aux1;clear aux2;
        end
    end


    %Borro las posibles trenzas sobrantes a derechas.
    hold off;
    n_cadenas_borrar = max(abs(indices_braid1))-max(abs(indices_braid2));
    if(max(abs(indices_braid2))==0)
        n_cadenas_borrar = n_cadenas_borrar +1;
    end
    if(n_cadenas_borrar >0)
        for t=0:0.1:1
            for j=1:1:size(matriz_x2,1)
                if(j>size(matriz_x2,1)-n_cadenas_borrar)
                    vector_x(1:size(matriz_x2,2))= matriz_x2(j,size(matriz_x2,2)) ;
                    vector_y(1:size(matriz_x2,2))= matriz_y2(j,size(matriz_y2,2)) ;
                    vector_z(1:size(matriz_x2,2))= matriz_z2(j,size(matriz_z2,2)) ;

                    x_tran = (1-t)*matriz_x2(j,:) + (t)*vector_x;
                    y_tran = (1-t)*matriz_y2(j,:) + (t)*vector_y;
                    z_tran = (1-t)*matriz_z2(j,:) + (t)*vector_z;
                else
                    x_tran = (1-t)*matriz_x2(j,:) + (t)*matriz_x2(j,:);
                    y_tran = (1-t)*matriz_y2(j,:) + (t)*matriz_y2(j,:);
                    z_tran = (1-t)*matriz_z2(j,:) + (t)*matriz_z2(j,:);
                end
                if j==1
                    aux1 = plot3(x_tran, y_tran, z_tran);
                    aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
                    hold on;
                else
                    aux1 = vertcat(aux1, plot3(x_tran, y_tran, z_tran));
                    aux2 = vertcat(aux2, tubep(x_tran,y_tran,z_tran,N_cortes,Radio));
                end
            end

            pause(0.1);
            if(t~=1)
                delete(aux1);delete(aux2);
                clear aux1;clear aux2;
            end
        end
    end
