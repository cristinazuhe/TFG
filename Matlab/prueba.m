[x,y,z] = giro_base();
[x_cil,y_cil,z_cil] = cilindro_base();
N_cortes = 20;
Radio = 0.5;

x1 = fliplr(x);
y1 = y;
z1 = z-3*pi;

x2 = x1+2;
y2 = y1;
z2 = z1-3*pi;
primera_x = [x2,x1,x];
primera_y = [y2,y1,y];
primera_z = [z2,z1,z];    
    
a_x1 = fliplr(x);
a_y1 = abs(y);
a_z1 = z-3*pi;

a_x2 = fliplr(a_x1);
a_y2 = a_y1;
a_z2 = a_z1-3*pi;
segunda_x = [a_x2,a_x1,x_cil];
segunda_y = [a_y2,a_y1,y_cil];
segunda_z = [a_z2,a_z1,z_cil];   
    
    
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



%estas son las otras 3 combinaciones posibles
%     hold on;
%     x0 = fliplr(x);
%     y0 = abs(y);
%     z0 = z;
%     plot3(x0,y0,z0);
%     tubep(x0,y0,z0,20,0.5);
%     
%     hold on;
%     x1 = fliplr(x);
%     y1 = y;
%     z1 = z-3*pi;
%     plot3(x1,y1,z1);
%     tubep(x1,y1,z1,20,0.5);
%     
%     hold on;
%     x2 = x;
%     y2 = abs(y);
%     z2 = z-3*pi;
%     plot3(x2,y2,z2);
%     tubep(x2,y2,z2,20,0.5);
    