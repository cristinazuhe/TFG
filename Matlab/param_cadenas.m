%Entrada: cadena de enteros que representa los cruces de una trenza.
%Salida: matrices representando las coordenadas x, y, z, de las
%parametrizaciones de cada una de las cadenas de la trenza. 
function [matriz_x, matriz_y, matriz_z ] = param_cadenas( indices_braid )
    [x_giro,y_giro,z_giro] = giro_base();
    [x_cil,y_cil,z_cil] = cilindro_base();
    
    if(size(indices_braid)==0) %esto no se si quitarlo....es para cuando me llega la trenza trivial
        matriz_x=0;matriz_y=0;matriz_z=0;
    end
    
    for cadena_actual=0:1:max(abs(indices_braid))
            contador = 0;
            n_cadena = cadena_actual+1;
            if(abs(indices_braid(1))==0)      
                x = x_cil+2*cadena_actual; y = y_cil; z = z_cil;
            elseif(abs(indices_braid(1)) == n_cadena)
                if(sign(indices_braid(1)) == 1)
                    x = fliplr(x_giro)+2*cadena_actual; y = abs(y_giro); z = z_giro;
                else
                    x = fliplr(x_giro)+2*cadena_actual; y = y_giro; z = z_giro;   
                end
                n_cadena = n_cadena+1;
                contador = contador+1;
            elseif(abs(indices_braid(1)) == n_cadena-1)
                if(sign(indices_braid(1)) == 1)
                    x = x_giro+2*(cadena_actual-1); y = y_giro; z = z_giro;
                else
                    x = x_giro+2*(cadena_actual-1); y = abs(y_giro); z = z_giro;   
                end
                contador = contador-1;
                n_cadena = n_cadena-1;
            else
                x = x_cil+2*cadena_actual; y = y_cil; z = z_cil;
            end
            for i=2:1:length(indices_braid)
                if(abs(indices_braid(i)) == 0)
                    siguiente_x = x_cil+2*(contador)+2*cadena_actual; siguiente_y = y_cil; siguiente_z = z_cil-3*pi*(i-1);
                elseif(abs(indices_braid(i)) == n_cadena)
                    contador = contador+1;
                    if(sign(indices_braid(i)) == 1)
                        siguiente_x = fliplr(x_giro)+2*(contador-1)+2*cadena_actual; siguiente_y = abs(y_giro); siguiente_z = z_giro-3*pi*(i-1);
                    else
                        siguiente_x = fliplr(x_giro)+2*(contador-1)+2*cadena_actual; siguiente_y = y_giro; siguiente_z = z_giro-3*pi*(i-1);   
                    end
                    n_cadena = n_cadena+1;
                elseif(abs(indices_braid(i)) == n_cadena-1)
                    contador = contador-1;
                    if(sign(indices_braid(i)) == 1)
                        siguiente_x = x_giro+2*(contador)+2*cadena_actual; siguiente_y = y_giro; siguiente_z = z_giro-3*pi*(i-1);
                    else
                        siguiente_x = x_giro+2*(contador)+2*cadena_actual; siguiente_y = abs(y_giro); siguiente_z = z_giro-3*pi*(i-1);   
                    end
                    n_cadena = n_cadena-1;
                else
                    siguiente_x = x_cil+2*(contador)+2*cadena_actual; siguiente_y = y_cil; siguiente_z = z_cil-3*pi*(i-1);
                end
                x = [siguiente_x,x]; 
                y = [siguiente_y,y];
                z = [siguiente_z,z];
            end
      if(cadena_actual ==0)
          matriz_x = x;matriz_y = y; matriz_z =z;
      else
          matriz_x =  vertcat(matriz_x,x);
          matriz_y =  vertcat(matriz_y,y);
          matriz_z =  vertcat(matriz_z,z);
      end
    end
    
end

