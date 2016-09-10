function [x,y,z] = cilindro_base()
    alpha=0:0.1:3*pi;
    l=zeros([1 length(alpha)]);

    x=l;y=l;z=alpha;
end

