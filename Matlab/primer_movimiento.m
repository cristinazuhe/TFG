indices_braid=[3 2 -2 1];


 for i=1:length(indices_braid)-1
    if(indices_braid(i) + indices_braid(i+1) == 0)
        nueva_braid = zeros(1,length(indices_braid)-2);
        contador=1;
        for j=1:length(indices_braid)  %genero la nueva trenza sin los crossing i, i+1
            if(j~=i && j~=i+1)
            nueva_braid(contador) = indices_braid(j);
            contador= contador+1;
            end
        end
        representar_primer_movimiento(indices_braid,20,0.7, i); %represento toda la trenza menos los crossing i,i+1 a borrar
        %representar_braid(nueva_braid,20,0.7); 
        
        
    end
end





%     contador=0;
%     inicio = -3*pi;
%     fin = 0;
%     N_cortes=20;
%     Radio = 0.7;
%    [p1,plt1,x1,y1,z1,x1_cil,y1_cil,z1_cil,...
%                  p2,plt2,x2,y2,z2,x2_cil,y2_cil,z2_cil] = braid_neg(1,inicio,fin,N_cortes,Radio); 
%     
%     x1_cross_n=x1; y1_cross_n=y1; z1_cross_n=z1;x1_cil_cross_n=x1_cil;y1_cil_cross_n=y1_cil;z1_cil_cross_n=z1_cil;
%     
%     
%     x1_cross=x1; y1_cross=y1; z1_cross=z1;x1_cil_cross=x1_cil;y1_cil_cross=y1_cil;z1_cil_cross=z1_cil;
%     au1n = x1_cil_cross_n; au2n = y1_cil_cross_n;au3n = z1_cil_cross_n;              
%     au1 = x1_cil_cross-1; au2 = y1_cil_cross-1;au3 = z1_cil_cross-1;
%                  
%     aul1 = x1_cil_cross-2; aul2 = y1_cil_cross-2;aul3 = z1_cil_cross-2;
%     nuevo = vertcat(au1,au1n, aul1);
%     nuevo(2,:);