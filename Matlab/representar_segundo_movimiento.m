function [p0,p1,p2,p3 ] = representar_segundo_movimiento(indices_braid, N_cortes, Radio, crossing )
    n_total_braid = max(abs(indices_braid))+1;
    contador=0;
    inicio = -3*pi;
    fin = 0;
    for i=1:length(indices_braid)
        cruce = indices_braid(i);

        for j=1:abs(cruce)-1
            [p0, plt0, x_cil_a,y_cil_a,z_cil_a] = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
            %para el cilindro del segundo crossing
             if (abs(indices_braid(crossing+1)) > abs(indices_braid(crossing)))
                 if(i == (crossing +1) && j == abs(cruce)-1)
                     delete ([p0,plt0]);
                     x_cil_centro=x_cil_a; y_cil_centro=y_cil_a; z_cil_centro=z_cil_a;
                     x_cil_centro_mod = x_cil_a + 4;
                 end               
             end
            %para el cilindro del primer y segundo crossing
            if (abs(indices_braid(crossing+1)) < abs(indices_braid(crossing)))
                 if((i == (crossing) || i == (crossing+2)) && j == abs(cruce)-1)
                     delete ([p0,plt0]);
                 end               
             end
            
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
                   if (abs(indices_braid(crossing+1)) > abs(indices_braid(crossing)))
                       if(mod(crossing,2) ==0)
                            x1_cil_cross1_n_mod1 = x2_cross1_n+2; x2_cil_cross1_n_mod1 = x2_cil_cross1_n-2;
                            x_cil_sup = x2_cil_cross1_n +2; y_cil_sup = y2_cil_cross1_n; z_cil_sup = z2_cil_cross1_n;
                            x_cross_sup_mod = x1_cross1_n+2; y_cross_sup = y1_cross1_n; z_cross_sup = z1_cross1_n;
                       else
                            x1_cil_cross1_n_mod1 = x1_cil_cross1_n-2; x2_cil_cross1_n_mod1 = x1_cross1_n+2;
                            x_cil_sup = x1_cil_cross1_n +2; y_cil_sup = y1_cil_cross1_n; z_cil_sup = z1_cil_cross1_n;
                            x_cross_sup_mod = x2_cross1_n+2; y_cross_sup = y2_cross1_n; z_cross_sup = z2_cross1_n;
                       end
                   else
                       if(mod(crossing,2) ==0)
                            x1_cil_cross1_n_mod1 = x2_cil_cross1_n; x2_cil_cross1_n_mod1 = x1_cross1_n-2;
                            x_cil_sup = x1_cil_cross1_n-2; y_cil_sup = y1_cil_cross1_n; z_cil_sup = z1_cil_cross1_n;
                            x_cross_sup_mod = x2_cross1_n-2; y_cross_sup = y2_cross1_n; z_cross_sup = z2_cross1_n;
                       else
                            x1_cil_cross1_n_mod1 = x2_cross1_n-2; x2_cil_cross1_n_mod1 = x1_cil_cross1_n;
                            x_cil_sup = x2_cil_cross1_n-2; y_cil_sup = y2_cil_cross1_n; z_cil_sup = z2_cil_cross1_n;
                            x_cross_sup_mod = x1_cross1_n-2; y_cross_sup = y1_cross1_n; z_cross_sup = z1_cross1_n;
                       end
                   end
             end
            
             if(i== (crossing+1)) 
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross2_n=x1; y1_cross2_n=y1; z1_cross2_n=z1;
                   x2_cross2_n=x2; y2_cross2_n=y2; z2_cross2_n=z2;                   
                   if (abs(indices_braid(crossing+1)) > abs(indices_braid(crossing)))
                        x1_cross2_n_mod1 = x1_cross2_n -2; x2_cross2_n_mod1 = x2_cross2_n-2;
                   else           
                        x1_cross2_n_mod1 = x1_cross2_n +2; x2_cross2_n_mod1 = x2_cross2_n+2;
                   end
                       
             end
             if(i== (crossing+2))   
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross3_n=x1; y1_cross3_n=y1; z1_cross3_n=z1;
                   x1_cil_cross3_n=x1_cil;y1_cil_cross3_n=y1_cil;z1_cil_cross3_n=z1_cil;
                   x2_cross3_n=x2; y2_cross3_n=y2; z2_cross3_n=z2;
                   x2_cil_cross3_n=x2_cil;y2_cil_cross3_n=y2_cil;z2_cil_cross3_n=z2_cil;                    
                   if (abs(indices_braid(crossing+1)) > abs(indices_braid(crossing)))
                       if(mod(crossing+2,2) ==0)
                            x1_cil_cross3_n_mod1 = x1_cil_cross3_n; x2_cil_cross3_n_mod1 = x1_cross3_n+2;
                            x_cil_inf = x2_cil_cross3_n +2; y_cil_inf = y2_cil_cross3_n; z_cil_inf = z2_cil_cross3_n;
                            x_cross_inf = x2_cross3_n+2; y_cross_inf = y2_cross3_n; z_cross_inf = z2_cross3_n;
                       else
                            x1_cil_cross3_n_mod1 = x2_cross3_n+2; x2_cil_cross3_n_mod1 = x2_cil_cross3_n;
                            x_cil_inf = x1_cil_cross3_n +2; y_cil_inf = y1_cil_cross3_n; z_cil_inf = z1_cil_cross3_n;
                            x_cross_inf = x1_cross3_n+2; y_cross_inf = y1_cross3_n; z_cross_inf = z1_cross3_n;
                       end
                   else
                       if(mod(crossing,2) ==0)
                            x1_cil_cross3_n_mod1 = x2_cross3_n-2; x2_cil_cross3_n_mod1 = x2_cil_cross3_n;
                            x_cil_inf = x1_cil_cross3_n -2; y_cil_inf = y1_cil_cross3_n; z_cil_inf = z1_cil_cross3_n;
                            x_cross_inf = x1_cross3_n-2; y_cross_inf = y1_cross3_n; z_cross_inf = z1_cross3_n;
                       else
                            x1_cil_cross3_n_mod1 = x1_cil_cross3_n; x2_cil_cross3_n_mod1 = x1_cross3_n-2;
                            x_cil_inf = x2_cil_cross3_n -2; y_cil_inf = y2_cil_cross3_n; z_cil_inf = z2_cil_cross3_n;
                            x_cross_inf = x2_cross3_n-2; y_cross_inf = y2_cross3_n; z_cross_inf = z2_cross3_n;
                       end
                   end
             end
        else   
            [p1,p2] = braid_pos(abs(cruce)+contador,inicio,fin,N_cortes,Radio);
            hold on;
        end
        contador = contador +3;

        for j=abs(cruce)+1:n_total_braid-1
            [p3, plt3, x_cil_d,y_cil_d,z_cil_d] = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1; 
            %para el cilindro del segundo crossing
            if (abs(indices_braid(crossing+1)) < abs(indices_braid(crossing)))
                 if(i == (crossing +1) && j == abs(cruce)+1)
                     delete ([p3,plt3]);
                     x_cil_centro=x_cil_d; y_cil_centro=y_cil_d; z_cil_centro=z_cil_d;
                     x_cil_centro_mod = x_cil_d - 4;
                 end               
            end
            %para el cilindro del primer y segundo crossing
            if (abs(indices_braid(crossing+1)) > abs(indices_braid(crossing)))
                 if((i == (crossing) || i == (crossing+2)) && j == abs(cruce)+1)
                     delete ([p3,plt3]);
                 end               
             end
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end
    
    
    
 for t=0:0.1:1
        %estos dos son para el cruce del centro que se va a la izquierda
        x_tran = (1-t)*x1_cross2_n + (t)*x1_cross2_n_mod1;
        y_tran = (1-t)*y1_cross2_n + (t)*y1_cross2_n;
        z_tran = (1-t)*z1_cross2_n + (t)*z1_cross2_n;
        aux1 = plot3(x_tran, y_tran, z_tran);
        aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);  
        
        x_tran = (1-t)*x2_cross2_n + (t)*x2_cross2_n_mod1;
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
        
%       %cilindro segundo cruce
        x_tran = (1-t)*x_cil_centro + (t)*x_cil_centro_mod;
        y_tran = (1-t)*y_cil_centro + (t)*y_cil_centro;
        z_tran = (1-t)*z_cil_centro + (t)*z_cil_centro;
        aux13 = plot3(x_tran, y_tran, z_tran);
        aux14 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
        
        %cilindro primer cruce      
        x_tran = (1-t)*x_cil_sup + (t)*x_cross_sup_mod;
        y_tran = (1-t)*y_cil_sup + (t)*y_cross_sup;
        z_tran = (1-t)*z_cil_sup + (t)*z_cross_sup;
        aux15 = plot3(x_tran, y_tran, z_tran);
        aux16 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
        
        %cilindro tercer cruce      
        x_tran = (1-t)*x_cil_inf + (t)*x_cross_inf;
        y_tran = (1-t)*y_cil_inf + (t)*y_cross_inf;
        z_tran = (1-t)*z_cil_inf + (t)*z_cross_inf;
        aux17 = plot3(x_tran, y_tran, z_tran);
        aux18 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
         
        pause(0.1);
        if(t~=1)
            delete(aux1);delete(aux2);delete(aux3);delete(aux4);
            delete(aux5);delete(aux6);delete(aux7);delete(aux8);
            delete(aux9);delete(aux10);delete(aux11);delete(aux12);
            delete(aux13);delete(aux14);
            delete(aux15);delete(aux16);
            delete(aux17);delete(aux18);
        end
  end


end


