function [p0,p1,p2,p3 ] = representar_segundo_movimiento(indices_braid, N_cortes, Radio, crossing )
    n_total_braid = max(abs(indices_braid))+1;
    contador=0;
    inicio = -3*pi;
    fin = 0;
    for i=1:length(indices_braid)
        cruce = indices_braid(i);

        for j=1:abs(cruce)-1
            p0 = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
        end
        if(cruce < 0)
           [p1,plt1,x1,y1,z1,x1_cil,y1_cil,z1_cil,...
            p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = braid_neg(abs(cruce)+contador,inicio,fin,N_cortes,Radio); 
            hold on;
             if(i== crossing)   
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross1_n=x1; y1_cross1_n=y1; z1_cross1_n=z1;
                   x1_cil_cross1_n=x1_cil;y1_cil_cross1_n=y1_cil;z1_cil_cross1_n=z1_cil;
                   x2_cross1_n=x2; y2_cross1_n=y2; z2_cross1_n=z2;
                   x2_cil_cross1_n=x2_cil;y2_cil_cross1_n=y2_cil;z2_cil_cross1_n=z2_cil;  
                   if(mod(crossing,2) ==0)
                        x1_cil_cross1_n_mod1 = x2_cross1_n+2; x2_cil_cross1_n_mod1 = x2_cil_cross1_n-2;
                   else
                        x1_cil_cross1_n_mod1 = x1_cil_cross1_n-2; x2_cil_cross1_n_mod1 = x1_cross1_n+2;
                   end
             end
            
             if(i== (crossing+1)) 
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross2_n=x1; y1_cross2_n=y1; z1_cross2_n=z1;
                   x2_cross2_n=x2; y2_cross2_n=y2; z2_cross2_n=z2;  
             end
             if(i== (crossing+2))   
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross3_n=x1; y1_cross3_n=y1; z1_cross3_n=z1;
                   x1_cil_cross3_n=x1_cil;y1_cil_cross3_n=y1_cil;z1_cil_cross3_n=z1_cil;
                   x2_cross3_n=x2; y2_cross3_n=y2; z2_cross3_n=z2;
                   x2_cil_cross3_n=x2_cil;y2_cil_cross3_n=y2_cil;z2_cil_cross3_n=z2_cil;  
                   if(mod(crossing+2,2) ==0)
                        x1_cil_cross3_n_mod1 = x1_cil_cross3_n; x2_cil_cross3_n_mod1 = x1_cross3_n+2;
                   else%bien
                        x1_cil_cross3_n_mod1 = x2_cross3_n+2; x2_cil_cross3_n_mod1 = x2_cil_cross3_n;
                   end
             end
        else   
            [p1,p2] = braid_pos(abs(cruce)+contador,inicio,fin,N_cortes,Radio);
            hold on;
        end
        contador = contador +3;

        for j=abs(cruce)+1:n_total_braid-1
            p3 = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end
    
    
    
 for t=0:0.1:1
        %estos dos son para el cruce del centro que se va a la izquierda
        x_tran = (1-t)*x1_cross2_n + (t)*(x1_cross2_n-2);
        y_tran = (1-t)*y1_cross2_n + (t)*y1_cross2_n;
        z_tran = (1-t)*z1_cross2_n + (t)*z1_cross2_n;
        aux1 = plot3(x_tran, y_tran, z_tran);
        aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);  
        
        x_tran = (1-t)*x2_cross2_n + (t)*(x2_cross2_n-2);
        y_tran = (1-t)*y2_cross2_n + (t)*y2_cross2_n;
        z_tran = (1-t)*z2_cross2_n + (t)*z2_cross2_n;
        aux3 = plot3(x_tran, y_tran, z_tran);
        aux4 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);  
        
        %estos dos son para el primer cruce
        x_tran = (1-t)*x1_cross1_n + (t)*(x1_cil_cross1_n_mod1);
        y_tran = (1-t)*y1_cross1_n + (t)*y1_cil_cross1_n;
        z_tran = (1-t)*z1_cross1_n + (t)*z1_cil_cross1_n;
        aux5 = plot3(x_tran, y_tran, z_tran);
        aux6 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
        
        x_tran = (1-t)*x2_cross1_n + (t)*(x2_cil_cross1_n_mod1);
        y_tran = (1-t)*y2_cross1_n + (t)*y2_cil_cross1_n;
        z_tran = (1-t)*z2_cross1_n + (t)*z2_cil_cross1_n;
        aux7 = plot3(x_tran, y_tran, z_tran);
        aux8 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);        
        
        %estos dos son para el tercer cruce
        x_tran = (1-t)*x1_cross3_n + (t)*(x1_cil_cross3_n_mod1);
        y_tran = (1-t)*y1_cross3_n + (t)*y1_cil_cross3_n;
        z_tran = (1-t)*z1_cross3_n + (t)*z1_cil_cross3_n;
        aux9 = plot3(x_tran, y_tran, z_tran);
        aux10 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
        
        x_tran = (1-t)*x2_cross3_n + (t)*(x2_cil_cross3_n_mod1);
        y_tran = (1-t)*y2_cross3_n + (t)*y2_cil_cross3_n;
        z_tran = (1-t)*z2_cross3_n + (t)*z2_cil_cross3_n;
        aux11 = plot3(x_tran, y_tran, z_tran);
        aux12 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
         
        pause(0.1);
        if(t~=1)
            delete(aux1);delete(aux2);delete(aux3);delete(aux4);
            delete(aux5);delete(aux6);delete(aux7);delete(aux8);
            delete(aux9);delete(aux10);delete(aux11);delete(aux12);
        end
  end


end

