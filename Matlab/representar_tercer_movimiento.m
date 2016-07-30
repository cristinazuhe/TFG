function [p0,p1,p2,p3 ] = representar_tercer_movimiento(indices_braid, N_cortes, Radio, crossing )
    n_total_braid = max(abs(indices_braid))+1;
    contador=0;
    inicio = -3*pi;
    fin = 0;
    for i=1:length(indices_braid)
        cruce = indices_braid(i);

        for j=1:abs(cruce)-1
            [p0,plt0] = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;         
            if i == (crossing+1)
                indice = abs(indices_braid(crossing));
                if j == (indice + 1) || j==indice
                    delete ([p0,plt0])
                end
            end
        end
        if(cruce < 0)
                [p1,plt1,x1,y1,z1,x1_cil,y1_cil,z1_cil,...
                 p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = braid_neg(abs(cruce)+contador,inicio,fin,N_cortes,Radio); 
                 hold on;
                 %Si el primer crossing es m�s alto, la funci�n inicial tendr� primero el cruce y luego el cilindro y 
                 %la funci�n final tendr� primero el cilindro y luego el crossing.
                 if(i== crossing)   
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross1_n=x1; y1_cross1_n=y1; z1_cross1_n=z1;
                   x1_cil_cross1_n=x1_cil;y1_cil_cross1_n=y1_cil;z1_cil_cross1_n=z1_cil;
                   x2_cross1_n=x2; y2_cross1_n=y2; z2_cross1_n=z2;
                   x2_cil_cross1_n=x2_cil;y2_cil_cross1_n=y2_cil;z2_cil_cross1_n=z2_cil;                                 
                 end
                 if(i== (crossing+1))   
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross2_n=x1; y1_cross2_n=y1; z1_cross2_n=z1;
                   x1_cil_cross2_n=x1_cil;y1_cil_cross2_n=y1_cil;z1_cil_cross2_n=z1_cil;
                   x2_cross2_n=x2; y2_cross2_n=y2; z2_cross2_n=z2;
                   x2_cil_cross2_n=x2_cil;y2_cil_cross2_n=y2_cil;z2_cil_cross2_n=z2_cil;                                
                 end
        else   
                 [p1,plt1,x1,y1,z1,x1_cil,y1_cil,z1_cil,...
                 p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = braid_pos(abs(cruce)+contador,inicio,fin,N_cortes,Radio);
                 hold on;         
                if(i== crossing || i==(crossing+1))
                  delete ([p1,plt1,p2,plt2]);
                  x1_cross=x1; y1_cross=y1; z1_cross=z1;x1_cil_cross=x1_cil;y1_cil_cross=y1_cil;z1_cil_cross=z1_cil;
                  x2_cross=x2; y2_cross=y2; z2_cross=z2;x2_cil_cross=x2_cil;y2_cil_cross=y2_cil;z2_cil_cross=z2_cil;
                end
        end
        contador = contador +3;

        for j=abs(cruce)+1:n_total_braid-1
            [p3,plt3] = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
            if i == crossing
                indice = abs(indices_braid(crossing+1));
                if j == (indice -1 ) || j==indice
                    delete ([p3,plt3])
                end
            end
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end

    
    
  for t=0:0.1:1
        x_tran1 = (1-t)*x1_cross1_n + (t)*(x1_cil_cross1_n+2);
        y_tran1 = (1-t)*y1_cross1_n + (t)*y1_cil_cross1_n;
        z_tran1 = (1-t)*z1_cross1_n + (t)*z1_cil_cross1_n;
        aux1 = plot3(x_tran1, y_tran1, z_tran1);
        aux2 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        x_tran1 = (1-t)*x1_cil_cross1_n + (t)*x1_cross1_n;
        y_tran1 = (1-t)*y1_cil_cross1_n + (t)*y1_cross1_n;
        z_tran1 = (1-t)*(z1_cil_cross1_n-3*pi) + (t)*(z1_cross1_n-3*pi);
        aux3 = plot3(x_tran1, y_tran1, z_tran1);
        aux4 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        
        x_tran1 = (1-t)*x2_cross1_n + (t)*(x2_cil_cross1_n-2);
        y_tran1 = (1-t)*y2_cross1_n + (t)*y2_cil_cross1_n;
        z_tran1 = (1-t)*z2_cross1_n + (t)*z2_cil_cross1_n;
        aux5 = plot3(x_tran1, y_tran1, z_tran1);
        aux6 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        x_tran1 = (1-t)*x2_cil_cross1_n + (t)*x2_cross1_n;
        y_tran1 = (1-t)*y2_cil_cross1_n + (t)*y2_cross1_n;
        z_tran1 = (1-t)*(z2_cil_cross1_n-3*pi) + (t)*(z2_cross1_n-3*pi);
        aux7 = plot3(x_tran1, y_tran1, z_tran1);
        aux8 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        %crossing+1
        x_tran1 = (1-t)*x1_cross2_n + (t)*x1_cil_cross2_n;
        y_tran1 = (1-t)*y1_cross2_n + (t)*y1_cil_cross2_n;
        z_tran1 = (1-t)*z1_cross2_n + (t)*z1_cil_cross2_n;
        aux9 = plot3(x_tran1, y_tran1, z_tran1);
        aux10 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        x_tran1 = (1-t)*(x1_cil_cross2_n-2) + (t)*x1_cross2_n;
        y_tran1 = (1-t)*y1_cil_cross2_n + (t)*y1_cross2_n;
        z_tran1 = (1-t)*(z1_cil_cross2_n+3*pi) + (t)*(z1_cross2_n+3*pi);
        aux11 = plot3(x_tran1, y_tran1, z_tran1);
        aux12 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        x_tran1 = (1-t)*x2_cross2_n + (t)*x2_cil_cross2_n;
        y_tran1 = (1-t)*y2_cross2_n + (t)*y2_cil_cross2_n;
        z_tran1 = (1-t)*z2_cross2_n + (t)*z2_cil_cross2_n;
        aux13 = plot3(x_tran1, y_tran1, z_tran1);
        aux14 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        x_tran1 = (1-t)*(x2_cil_cross2_n+2) + (t)*x2_cross2_n;
        y_tran1 = (1-t)*y2_cil_cross2_n + (t)*y2_cross2_n;
        z_tran1 = (1-t)*(z2_cil_cross2_n+3*pi) + (t)*(z2_cross2_n+3*pi);
        aux15 = plot3(x_tran1, y_tran1, z_tran1);
        aux16 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
       
        pause(1);
        if(t~=1)
         delete(aux1);delete(aux2);delete(aux3);delete(aux4);
         delete(aux5);delete(aux6);delete(aux7);delete(aux8);
         delete(aux9);delete(aux10);delete(aux11);delete(aux12);
         delete(aux13);delete(aux14);delete(aux15);delete(aux16);
        end
  end
    

end


%                    x1_cross1_inicio_u = x1_cross_n;
%                    y1_cross1_inicio_u = y1_cross_n;
%                    z1_cross1_inicio_u = z1_cross_n;                  
%                                      
%                    x1_cross1_fin_u = (x1_cil_cross_n+2);
%                    y1_cross1_fin_u = y1_cil_cross_n;
%                    z1_cross1_fin_u = z1_cil_cross_n;   
%                    
%                    x1_cross1_inicio_d = x1_cil_cross_n;
%                    y1_cross1_inicio_d = y1_cil_cross_n;
%                    z1_cross1_inicio_d = (z1_cil_cross_n-3*pi);                  
%                                      
%                    x1_cross1_fin_d = x1_cross_n;
%                    y1_cross1_fin_d = y1_cross_n;
%                    z1_cross1_fin_d = (z1_cross_n-3*pi); 
