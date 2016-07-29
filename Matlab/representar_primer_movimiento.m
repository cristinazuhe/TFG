function [p0,p1,p2,p3 ] = representar_primer_movimiento(indices_braid, N_cortes, Radio, crossing )
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
            %este bloque if me va a permitir borrar más adelante los cilindros de los
            %crossing que causan el primer movimiento.
            if(i==crossing || i==(crossing+1))
                if(j==1 && i==crossing)
                    p_antes = p0;
                    plt_antes = plt0;     
                    x_cil_antes=x_cil_a; y_cil_antes=y_cil_a; z_cil_antes=z_cil_a;
                else
                    p_antes = vertcat(p_antes, p0);
                    plt_antes = vertcat(plt_antes, plt0);
                    x_cil_antes = vertcat(x_cil_antes, x_cil_a);
                    y_cil_antes = vertcat(y_cil_antes, y_cil_a);
                    z_cil_antes = vertcat(z_cil_antes, z_cil_a);
                    
                end
            end
        end
        if(cruce < 0)
                [p1,plt1,x1,y1,z1,x1_cil,y1_cil,z1_cil,...
                 p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = braid_neg(abs(cruce)+contador,inicio,fin,N_cortes,Radio); 
                 hold on;           
                 if(i== crossing || i==(crossing+1))
                   delete ([p1,plt1,p2,plt2]);
                   x1_cross_n=x1; y1_cross_n=y1; z1_cross_n=z1;x1_cil_cross_n=x1_cil;y1_cil_cross_n=y1_cil;z1_cil_cross_n=z1_cil;
                   x2_cross_n=x2; y2_cross_n=y2; z2_cross_n=z2;x2_cil_cross_n=x2_cil;y2_cil_cross_n=y2_cil;z2_cil_cross_n=z2_cil;
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
            [p3, plt3, x_cil_d,y_cil_d,z_cil_d] = cilindro_braid(j+contador,inicio,fin,N_cortes,Radio);
            hold on;
            contador = contador +1;           
            %este bloque if me va a permitir borrar más adelante los cilindros de los
            %crossing que causan el primer movimiento.
            if(i==crossing || i==(crossing+1))
                if(j==(abs(cruce)+1) && i==crossing)
                    p_despues = p3;
                    plt_despues = plt3;     
                    x_cil_despues=x_cil_d; y_cil_despues=y_cil_d; z_cil_despues=z_cil_d;
                else
                    p_despues = vertcat(p_despues, p3);
                    plt_despues = vertcat(plt_despues, plt3);
                    x_cil_despues = vertcat(x_cil_despues, x_cil_d);
                    y_cil_despues = vertcat(y_cil_despues, y_cil_d);
                    z_cil_despues = vertcat(z_cil_despues, z_cil_d);
                    
                end
            end
        end

        inicio = inicio -3*pi;
        fin = fin -3*pi;
        contador = 0; 
    end
    
  %hago movimiento de los crossing i,i+1 
  for t=0:0.1:1
        x_tran1 = (1-t)*x1_cross + (t)*x1_cil_cross;
        y_tran1 = (1-t)*y1_cross + (t)*y1_cil_cross;
        z_tran1 = (1-t)*z1_cross + (t)*z1_cil_cross;
        aux1 = plot3(x_tran1, y_tran1, z_tran1);
        aux2 = tubep(x_tran1,y_tran1,z_tran1,N_cortes,Radio);

        x_tran2 = (1-t)*x2_cross + (t)*x2_cil_cross;
        y_tran2 = (1-t)*y2_cross + (t)*y2_cil_cross;
        z_tran2 = (1-t)*z2_cross + (t)*z2_cil_cross;
        aux3 = plot3(x_tran2, y_tran2, z_tran2);
        aux4 = tubep(x_tran2,y_tran2,z_tran2,N_cortes,Radio);

        x_tran1n = (1-t)*x1_cross_n + (t)*x1_cil_cross_n;
        y_tran1n = (1-t)*y1_cross_n + (t)*y1_cil_cross_n;
        z_tran1n = (1-t)*z1_cross_n + (t)*z1_cil_cross_n;
        aux1n = plot3(x_tran1n,y_tran1n,z_tran1n);
        aux2n = tubep(x_tran1n,y_tran1n,z_tran1n,N_cortes,Radio);

        x_tran2n = (1-t)*x2_cross_n + (t)*x2_cil_cross_n;
        y_tran2n = (1-t)*y2_cross_n + (t)*y2_cil_cross_n;
        z_tran2n = (1-t)*z2_cross_n + (t)*z2_cil_cross_n;
        aux3n = plot3(x_tran2n, y_tran2n, z_tran2n);
        aux4n = tubep(x_tran2n,y_tran2n,z_tran2n,N_cortes,Radio);
        
        pause(0.1);
        delete(aux1n);delete(aux2n);delete(aux3n);delete(aux4n);
        delete(aux1);delete(aux2);delete(aux3);delete(aux4);
  end

  
 %borro los cilindros sobrantes a las trenzas del crossing i, i+1 
 delete([p_antes,plt_antes]);delete([p_despues,plt_despues]);
 
 %borro los cilindros sobrantes con movimiento... 
 au1 = x1_cil_cross; au2 = y1_cil_cross;au3 = z1_cil_cross;
 au1_2 = x2_cil_cross;au2_2 = y2_cil_cross;au3_2 = z2_cil_cross;
 au1n = x1_cil_cross_n; au2n = y1_cil_cross_n;au3n = z1_cil_cross_n;
 au1_2n = x2_cil_cross_n;au2_2n = y2_cil_cross_n;au3_2n = z2_cil_cross_n;
 
 au_antes_1 = x_cil_antes; au_antes_2 = y_cil_antes; au_antes_3 = z_cil_antes;
 au_despues_1 = x_cil_despues; au_despues_2 = y_cil_despues; au_despues_3 = z_cil_despues;

 aumat1 = vertcat(au1, au1_2, au1n, au1_2n, au_antes_1, au_despues_1);
 aumat2 = vertcat(au2, au2_2, au2n, au2_2n, au_antes_2, au_despues_2);     
 aumat3 = vertcat(au3, au3_2, au3n, au3_2n, au_antes_3, au_despues_3);
 for t=1:5:length(z1_cil_cross)
      dim = size(aumat3);
      for i=1:1:5 %para que el cilindro se borre más rápido.
          aumat1(:,1)=[];aumat2(:,1)=[];aumat3(:,1)=[];
      end
      for j=1:1:dim(1)
          x_tran =  aumat1(j,:);y_tran = aumat2(j,:); z_tran = aumat3(j,:);
          if j==1
            auxi1 = plot3(x_tran, y_tran, z_tran);
            auxi2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
          else
              auxi1 = vertcat(auxi1, plot3(x_tran, y_tran, z_tran));
              auxi2 = vertcat(auxi2, tubep(x_tran,y_tran,z_tran,N_cortes,Radio));
          end
      end
      tic(); pause(0.001); toc();
      delete(auxi1);delete(auxi2);
      clear auxi1;clear auxi2;
end
       
                  


end



