N_cortes = 20;
Radio = 0.5;
indices_braid1=[];
indices_braid2=[-3 +4 +3 -2];

%transicion_braids(indices_braid1,indices_braid2, 20,0.5);
%[mx,my,mz] = param_cadenas(indices_braid1);

    [matriz_x1,matriz_y1,matriz_z1] = param_cadenas(indices_braid1);
    [matriz_x2,matriz_y2,matriz_z2] = param_cadenas(indices_braid2);
    
    %Si las trenzas tienen distinto numero de cruces, tenemos que tener la
    %misma dimension en las matrices.
    dim_actual_2 = size(matriz_x2,2);   
    dim_actual_1 = size(matriz_x1,2);
    if(size(matriz_x1,2) > size(matriz_x2,2))
       for i=1:1:size(matriz_x2,1)
          matriz_x2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_x2(i,dim_actual_2) ;   
          matriz_y2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_y2(i,dim_actual_2) ; 
          matriz_z2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_z2(i,dim_actual_2) ; 
       end
     elseif (size(matriz_x1,2) < size(matriz_x2,2))
        for i=1:1:size(matriz_x1,1)
            matriz_x1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_x1(i,dim_actual_1) ;   
            matriz_y1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_y1(i,dim_actual_1) ; 
            matriz_z1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_z1(i,dim_actual_1) ; 
        end
    end
      
    if(size(matriz_x1,1) > size(matriz_x2,1))
       for i=1:1:size(matriz_x2,1)
          matriz_x2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_x2(i,dim_actual_2) ;   
          matriz_y2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_y2(i,dim_actual_2) ; 
          matriz_z2(i,dim_actual_2+1:size(matriz_x1,2))= matriz_z2(i,dim_actual_2) ; 
       end
     elseif (size(matriz_x1,1) < size(matriz_x2,1))
        for i=1:1:size(matriz_x1,1)
            matriz_x1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_x1(i,dim_actual_1) ;   
            matriz_y1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_y1(i,dim_actual_1) ; 
            matriz_z1(i,dim_actual_1+1:size(matriz_x2,2))= matriz_z1(i,dim_actual_1) ; 
        end
    end
    