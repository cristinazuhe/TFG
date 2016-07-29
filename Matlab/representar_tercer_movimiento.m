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
                 if(i== crossing)   
                   alpha=inicio:0.1:fin;
                   alpha2=(inicio-3*pi):0.1:(fin-3*pi);
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross_n=x1; y1_cross_n=y1; z1_cross_n=z1;x1_cil_cross_n=x1_cil;y1_cil_cross_n=y1_cil;z1_cil_cross_n=z1_cil;
                   x2_cross_n=x2; y2_cross_n=y2; z2_cross_n=z2;x2_cil_cross_n=x2_cil;y2_cil_cross_n=y2_cil;z2_cil_cross_n=z2_cil;
                   x1_cross_n_full_inicio = ((alpha>=inicio)&(alpha<=fin)).*x1_cross_n +...
                                            ((alpha2>=(inicio-3*pi))&(alpha2<=(fin-3*pi))).*x1_cil_cross_n;
                   y1_cross_n_full_inicio = ((alpha>=inicio)&(alpha<=fin)).*y1_cross_n +...
                                            ((alpha2>=(inicio-3*pi))&(alpha2<=(fin-3*pi))).*y1_cil_cross_n;
                   z1_cross_n_full_inicio = ((alpha>=inicio)&(alpha<=fin)).*z1_cross_n +...
                                            ((alpha2>=(inicio-3*pi))&(alpha2<=(fin-3*pi))).*z1_cil_cross_n;                  
                   x2_cross_n_full_inicio = ((alpha>=inicio)&(alpha<=fin)).*x2_cross_n +...
                                            ((alpha>=inicio-3*pi)&(alpha<=fin-3*pi)).*x2_cil_cross_n;
                   y2_cross_n_full_inicio = ((alpha>=inicio)&(alpha<=fin)).*y2_cross_n +...
                                            ((alpha>=inicio-3*pi)&(alpha<=fin-3*pi)).*y2_cil_cross_n;
                   z2_cross_n_full_inicio = ((alpha>=inicio)&(alpha<=fin)).*z2_cross_n +...
                                            ((alpha>=inicio-3*pi)&(alpha<=fin-3*pi)).*z2_cil_cross_n;
                                     
                   x1_cross_n_full_fin = ((alpha>=inicio)&(alpha<=fin)).*x1_cil_cross_n +...
                                         ((alpha2>=(inicio-3*pi))&(alpha2<=(fin-3*pi))).*x1_cross_n;
                   y1_cross_n_full_fin = ((alpha>=inicio)&(alpha<=fin)).*y1_cil_cross_n +...
                                         ((alpha2>=(inicio-3*pi))&(alpha2<=(fin-3*pi))).*y1_cross_n;
                   z1_cross_n_full_fin = ((alpha>=inicio)&(alpha<=fin)).*z1_cil_cross_n +...
                                         ((alpha2>=(inicio-3*pi))&(alpha2<=(fin-3*pi))).*z1_cross_n;                  
                   x2_cross_n_full_fin = ((alpha>=inicio)&(alpha<=fin)).*x2_cil_cross_n +...
                                         ((alpha>=inicio-3*pi)&(alpha<=fin-3*pi)).*x2_cross_n;
                   y2_cross_n_full_fin = ((alpha>=inicio)&(alpha<=fin)).*y2_cil_cross_n +...
                                         ((alpha>=inicio-3*pi)&(alpha<=fin-3*pi)).*y2_cross_n;
                   z2_cross_n_full_fin = ((alpha>=inicio)&(alpha<=fin)).*z2_cil_cross_n +...
                                         ((alpha>=inicio-3*pi)&(alpha<=fin-3*pi)).*z2_cross_n;
                                 
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
            p3 = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end

    
    
  for t=0:0.1:1
        x_tran1 = (1-t)*x1_cross_n_full_inicio + (t)*x1_cross_n_full_fin;
        y_tran1 = (1-t)*y1_cross_n_full_inicio + (t)*y1_cross_n_full_fin;
        z_tran1 = (1-t)*z1_cross_n_full_inicio + (t)*z1_cross_n_full_fin;
        aux1 = plot3(x_tran1, y_tran1, z_tran1);
        aux2 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);
        
        pause(1);
        delete(aux1);delete(aux2);
  end
    

end



