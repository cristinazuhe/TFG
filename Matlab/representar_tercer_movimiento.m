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
            if (abs(indices_braid(crossing)) < abs(indices_braid(crossing+1)))
                if i == (crossing+1)
                    indice = abs(indices_braid(crossing));
                    if j == (indice + 1) || j==indice
                        delete ([p0,plt0])
                    end
                end
            end
            if (abs(indices_braid(crossing)) > abs(indices_braid(crossing+1)))
                if i == (crossing)
                    indice = abs(indices_braid(crossing+1));
                    if j == (indice + 1) || j==indice
                        delete ([p0,plt0])
                    end
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
                   if(mod(crossing,2) ==0)
                        x1_cil_cross1_n_mod2 = x1_cil_cross1_n+2; x2_cil_cross1_n_mod2 = x2_cil_cross1_n - 2;
                   else
                        x1_cil_cross1_n_mod2 = x1_cil_cross1_n-2; x2_cil_cross1_n_mod2 = x2_cil_cross1_n + 2;
                   end
                   x1_cil_cross1_n_mod1 = x1_cil_cross1_n; x2_cil_cross1_n_mod1 = x2_cil_cross1_n;
                 end
                 if(i== (crossing+1))  
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross2_n=x1; y1_cross2_n=y1; z1_cross2_n=z1;
                   x1_cil_cross2_n=x1_cil;y1_cil_cross2_n=y1_cil;z1_cil_cross2_n=z1_cil;
                   x2_cross2_n=x2; y2_cross2_n=y2; z2_cross2_n=z2;
                   x2_cil_cross2_n=x2_cil;y2_cil_cross2_n=y2_cil;z2_cil_cross2_n=z2_cil;                   
                   if(mod((crossing+1),2) ==0)
                        x1_cil_cross2_n_mod2 = x1_cil_cross2_n+2; x2_cil_cross2_n_mod2 = x2_cil_cross2_n - 2;
                   else
                        x1_cil_cross2_n_mod2 = x1_cil_cross2_n-2; x2_cil_cross2_n_mod2 = x2_cil_cross2_n + 2;
                   end
                   x1_cil_cross2_n_mod1 = x1_cil_cross2_n; x2_cil_cross2_n_mod1 = x2_cil_cross2_n;
                 end
        else   
                 [p1,plt1,x1,y1,z1,x1_cil,y1_cil,z1_cil,...
                 p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = braid_pos(abs(cruce)+contador,inicio,fin,N_cortes,Radio);
                 hold on;         
                 if(i== crossing)   
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross1_n=x1; y1_cross1_n=y1; z1_cross1_n=z1;
                   x1_cil_cross1_n=x1_cil;y1_cil_cross1_n=y1_cil;z1_cil_cross1_n=z1_cil;
                   x2_cross1_n=x2; y2_cross1_n=y2; z2_cross1_n=z2;
                   x2_cil_cross1_n=x2_cil;y2_cil_cross1_n=y2_cil;z2_cil_cross1_n=z2_cil;  
                   if(mod(crossing,2) ==0)
                        x1_cil_cross1_n_mod1 = x1_cil_cross1_n-2; x2_cil_cross1_n_mod1 = x2_cil_cross1_n+2;
                   else
                        x1_cil_cross1_n_mod1 = x1_cil_cross1_n+2; x2_cil_cross1_n_mod1 = x2_cil_cross1_n-2;
                   end
                   x1_cil_cross1_n_mod2 = x1_cil_cross1_n; x2_cil_cross1_n_mod2 = x2_cil_cross1_n;
                 end
                 if(i== (crossing+1)) 
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross2_n=x1; y1_cross2_n=y1; z1_cross2_n=z1;
                   x1_cil_cross2_n=x1_cil;y1_cil_cross2_n=y1_cil;z1_cil_cross2_n=z1_cil;
                   x2_cross2_n=x2; y2_cross2_n=y2; z2_cross2_n=z2;
                   x2_cil_cross2_n=x2_cil;y2_cil_cross2_n=y2_cil;z2_cil_cross2_n=z2_cil;                   
                   if(mod((crossing+1),2) ==0)
                        x1_cil_cross2_n_mod1 = x1_cil_cross2_n-2; x2_cil_cross2_n_mod1 = x2_cil_cross2_n+2;
                   else
                        x1_cil_cross2_n_mod1 = x1_cil_cross2_n+2; x2_cil_cross2_n_mod1 = x2_cil_cross2_n-2;
                   end  
                   x1_cil_cross2_n_mod2 = x1_cil_cross2_n; x2_cil_cross2_n_mod2 = x2_cil_cross2_n;                           
                 end
        end
        contador = contador +3;

        for j=abs(cruce)+1:n_total_braid-1
            [p3,plt3] = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;
            if (abs(indices_braid(crossing)) < abs(indices_braid(crossing+1)))
                if i == (crossing)
                    indice = abs(indices_braid(crossing+1));
                    if j == (indice - 1) || j==indice
                        delete ([p3,plt3])
                    end
                end
            end
            if (abs(indices_braid(crossing)) > abs(indices_braid(crossing+1)))
                if i == (crossing+1)
                    indice = abs(indices_braid(crossing));
                    if j == (indice - 1) || j==indice
                        delete ([p3,plt3])
                    end
                end
            end
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end

    
  %hago el movimiento de las trenzas  
  aumat1 = vertcat(x1_cross1_n, x1_cil_cross1_n_mod1, x2_cross1_n, x2_cil_cross1_n_mod1,...
                   x1_cross2_n, x1_cil_cross2_n_mod2, x2_cross2_n,x2_cil_cross2_n_mod2 );
  aumat2 = vertcat(x1_cil_cross1_n_mod2, x1_cross1_n, x2_cil_cross1_n_mod2, x2_cross1_n,...
                   x1_cil_cross2_n_mod1, x1_cross2_n, x2_cil_cross2_n_mod1, x2_cross2_n);          
  aumat3 = vertcat(y1_cross1_n, y1_cil_cross1_n, y2_cross1_n, y2_cil_cross1_n,...
                   y1_cross2_n,y1_cil_cross2_n, y2_cross2_n, y2_cil_cross2_n);
  aumat4 = vertcat(y1_cil_cross1_n,y1_cross1_n,y2_cil_cross1_n, y2_cross1_n,...
                   y1_cil_cross2_n, y1_cross2_n, y2_cil_cross2_n, y2_cross2_n);
  aumat5 = vertcat(z1_cross1_n,(z1_cil_cross1_n-3*pi),z2_cross1_n, (z2_cil_cross1_n-3*pi),...
                   z1_cross2_n, (z1_cil_cross2_n+3*pi), z2_cross2_n, (z2_cil_cross2_n+3*pi));
  aumat6 = vertcat(z1_cil_cross1_n,(z1_cross1_n-3*pi), z2_cil_cross1_n, (z2_cross1_n-3*pi),...
                   z1_cil_cross2_n,(z1_cross2_n+3*pi), z2_cil_cross2_n, (z2_cross2_n+3*pi));
  for t=0:0.1:1
        dim = size(aumat1);
        for j=1:1:dim(1)
            x_tran = (1-t)*aumat1(j,:) + (t)*aumat2(j,:);
            y_tran = (1-t)*aumat3(j,:) + (t)*aumat4(j,:);
            z_tran = (1-t)*aumat5(j,:) + (t)*aumat6(j,:);
            if j==1
                aux1 = plot3(x_tran, y_tran, z_tran);
                aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
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

