function [p0,p1,p2,p3 ] = representar_tercer_movimiento(indices_braid, N_cortes, Radio, crossing )
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
                 %Si el primer crossing es más alto, la función inicial tendrá primero el cruce y luego el cilindro y 
                 %la función final tendrá primero el cilindro y luego el crossing.
                 if(i== crossing || i==(crossing+1))   
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross_n=x1; y1_cross_n=y1; z1_cross_n=z1;x1_cil_cross_n=x1_cil;y1_cil_cross_n=y1_cil;z1_cil_cross_n=z1_cil;
                   x2_cross_n=x2; y2_cross_n=y2; z2_cross_n=z2;x2_cil_cross_n=x2_cil;y2_cil_cross_n=y2_cil;z2_cil_cross_n=z2_cil;
                   x1_cross1_inicio_u = x1_cross_n;
                   y1_cross1_inicio_u = y1_cross_n;
                   z1_cross1_inicio_u = z1_cross_n;                  
                                     
                   x1_cross1_fin_u = (x1_cil_cross_n+2);
                   y1_cross1_fin_u = y1_cil_cross_n;
                   z1_cross1_fin_u = z1_cil_cross_n;   
                   
                   x1_cross1_inicio_d = x1_cil_cross_n;
                   y1_cross1_inicio_d = y1_cil_cross_n;
                   z1_cross1_inicio_d = (z1_cil_cross_n-3*pi);                  
                                     
                   x1_cross1_fin_d = x1_cross_n;
                   y1_cross1_fin_d = y1_cross_n;
                   z1_cross1_fin_d = (z1_cross_n-3*pi); 
                                 
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
            if i == crossing+1
                indice = abs(indices_braid(crossing));
                if j == (indice -1) || j==indice
                    delete ([p3,plt3])
                end
            end
            if i == crossing
                indice = abs(indices_braid(crossing+1));
                if j == (indice -1) || j==indice
                    delete ([p3,plt3])
                end
            end
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end

    
    
%   for t=0:0.1:1
%         x_tran1 = (1-t)*x1_cross1_inicio_u + (t)*x1_cross1_fin_u;
%         y_tran1 = (1-t)*y1_cross1_inicio_u + (t)*y1_cross1_fin_u;
%         z_tran1 = (1-t)*z1_cross1_inicio_u + (t)*z1_cross1_fin_u;
%         aux1 = plot3(x_tran1, y_tran1, z_tran1);
%         aux2 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
%         
%         x_tran1_d = (1-t)*x1_cross1_inicio_d + (t)*x1_cross1_fin_d;
%         y_tran1_d = (1-t)*y1_cross1_inicio_d + (t)*y1_cross1_fin_d;
%         z_tran1_d = (1-t)*z1_cross1_inicio_d + (t)*z1_cross1_fin_d;
%         aux3 = plot3(x_tran1_d, y_tran1_d, z_tran1_d);
%         aux4 = tubep(x_tran1_d,y_tran1_d,z_tran1_d,N_cortes,Radio);
%         
%         pause(1);
%         delete(aux1);delete(aux2);delete(aux3);delete(aux4);
%   end
    

end


%                    x1_cross_n_full_inicio = ((alpha>=inicio) & (alpha<=fin)).*(x1_cross_n)+...
%                                             ((alpha2>=(inicio-3*pi)) & (alpha2<=(fin-3*pi))).*x1_cil_cross_n;
%                    y1_cross_n_full_inicio = ((alpha>=inicio) & (alpha<=fin)).*(y1_cross_n)+...
%                                             ((alpha2>=(inicio-3*pi)) & (alpha2<=(fin-3*pi))).*y1_cil_cross_n;
%                    z1_cross_n_full_inicio = ((alpha>=inicio) & (alpha<=fin)).*(z1_cross_n)+...
%                                             ((alpha2>=(inicio-3*pi)) & (alpha2<=(fin-3*pi))).*(z1_cil_cross_n-3*pi);                  
%                                      
%                    x1_cross_n_full_fin = ((alpha2>=(inicio-3*pi)) & (alpha2<=(fin-3*pi))).*x1_cross_n +...
%                                          ((alpha>=inicio) & (alpha<=fin)).*(x1_cil_cross_n+2);
%                    y1_cross_n_full_fin = ((alpha2>=(inicio-3*pi)) & (alpha2<=(fin-3*pi))).*y1_cross_n +...
%                                          ((alpha>=inicio) & (alpha<=fin)).*y1_cil_cross_n;
%                    z1_cross_n_full_fin = ((alpha2>=(inicio-3*pi)) & (alpha2<=(fin-3*pi))).*(z1_cross_n -3*pi) +...
%                                          ((alpha>=inicio) & (alpha<=fin)).*z1_cil_cross_n; 
