function [x,y,z] = cilindro_base()
%CILINDRO_BASE
%Obtengo las coordenadas x, y ,z del cilindro base de una trenza. 
    alpha=0:0.1:3*pi;
    l=zeros([1 length(alpha)]);

    x=l;y=l;z=alpha;
end

