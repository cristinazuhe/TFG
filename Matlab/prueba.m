[x_giro,y_giro,z_giro] = giro_base();
[x_cil,y_cil,z_cil] = cilindro_base();
N_cortes = 20;
Radio = 0.5;
indices_braid=[+2 +3 +5 +3 -4 +2];

for cadena_actual=1:1:(max(abs(indices_braid))+1)
        contador = 0;
        n_cadena = cadena_actual;
        if(abs(indices_braid(1)) == n_cadena)
            if(sign(indices_braid(1)) == 1)
                x = fliplr(x_giro)+2*(cadena_actual-1); y = abs(y_giro); z = z_giro;
            else
                x = fliplr(x_giro)+2*(cadena_actual-1); y = y_giro; z = z_giro;   
            end
            n_cadena = n_cadena+1;
            contador = contador+1;
        elseif(abs(indices_braid(1)) == n_cadena-1)
            if(sign(indices_braid(1)) == 1)
                x = x_giro+2*(cadena_actual-1); y = y_giro; z = z_giro;
            else
                x = x_giro+2*(cadena_actual-1); y = abs(y_giro); z = z_giro;   
            end
            n_cadena = n_cadena-1;
        else
            x = x_cil+2*(cadena_actual-1); y = y_cil; z = z_cil;
        end
        for i=2:1:length(indices_braid)
            if(abs(indices_braid(i)) == n_cadena)
                contador = contador+1;
                if(sign(indices_braid(i)) == 1)
                    siguiente_x = fliplr(x_giro)+2*(contador-1)+2*(cadena_actual-1); siguiente_y = abs(y_giro); siguiente_z = z_giro-3*pi*(i-1);
                else
                    siguiente_x = fliplr(x_giro)+2*(contador-1)+2*(cadena_actual-1); siguiente_y = y_giro; siguiente_z = z_giro-3*pi*(i-1);   
                end
                n_cadena = n_cadena+1;
            elseif(abs(indices_braid(i)) == n_cadena-1)
                contador = contador-1;
                if(sign(indices_braid(i)) == 1)
                    siguiente_x = x_giro+2*(contador)+2*(cadena_actual-1); siguiente_y = y_giro; siguiente_z = z_giro-3*pi*(i-1);
                else
                    siguiente_x = x_giro+2*(contador)+2*(cadena_actual-1); siguiente_y = abs(y_giro); siguiente_z = z_giro-3*pi*(i-1);   
                end
                n_cadena = n_cadena-1;
            else
                siguiente_x = x_cil+2*(contador)+2*(cadena_actual-1); siguiente_y = y_cil; siguiente_z = z_cil-3*pi*(i-1);
            end
            x = [siguiente_x,x]; 
            y = [siguiente_y,y];
            z = [siguiente_z,z];
        end
  if(cadena_actual ==1)
      matriz_x = x;matriz_y = y; matriz_z =z;
  else
      matriz_x =  vertcat(matriz_x,x);
      matriz_y =  vertcat(matriz_y,y);
      matriz_z =  vertcat(matriz_z,z);
  end
end
 
    for i=1:1:3%size(matriz_z,1)
        plot3(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:));
        tubep(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:),20,0.5);
        hold on;
    end
    
% a_x1 = fliplr(x);
% a_y1 = abs(y);
% a_z1 = z-3*pi;
% 
% a_x2 = fliplr(a_x1);
% a_y2 = a_y1;
% a_z2 = a_z1-3*pi;
% segunda_x = [a_x2,a_x1,x_cil];
% segunda_y = [a_y2,a_y1,y_cil];
% segunda_z = [a_z2,a_z1,z_cil];   
    
    
    %esto lo hago para pintar todas las cadenas a la vez
%     matriz_x =  vertcat(primera_x,segunda_x);
%     matriz_y = vertcat(primera_y,segunda_y);
%     matriz_z = vertcat(primera_z,segunda_z);
%     for i=1:1:size(matriz_z,1)
%         plot3(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:));
%         tubep(matriz_x(i,:),matriz_y(i,:),matriz_z(i,:),20,0.5);
%         hold on;
%     end

    %esto es lo que voy a hacer para pasar de la cadena primera a segunda
%   for t=0:0.1:1
%         x_tran = (1-t)*primera_x + (t)*segunda_x;
%         y_tran = (1-t)*primera_y + (t)*segunda_y;
%         z_tran = (1-t)*primera_z + (t)*segunda_z;
%         aux1 = plot3(x_tran, y_tran, z_tran);
%         aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);      
%         pause(0.1);
%         if(t~=1)
%             delete(aux1);delete(aux2);
%             clear aux1;clear aux2;
%         end
%   end



