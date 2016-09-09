function [x,y,z] = cilindro_base()
    alpha=0:0.1:3*pi;
    l=zeros([1 length(alpha)]);

    x0=l;y0=l;z0=alpha;
    
    x = ((alpha>=0)&(alpha<=3*pi)).*x0 ;
    y = ((alpha>=0)&(alpha<=3*pi)).*y0;
    z = ((alpha>=0)&(alpha<=3*pi)).*z0;
end

