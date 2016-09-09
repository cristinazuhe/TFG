function [x,y,z] = giro_base() 
    alpha=0:0.1:3*pi;
    l=zeros([1 length(alpha)]);

    x0=l;y0=l;z0=alpha;
    x1=cos(alpha)+1;y1=sin(alpha);z1=alpha;
    x2=l+2;y2=l;z2=alpha;

    x = ((alpha>=0)&(alpha<=pi)).*x0 + ((alpha>=pi)&(alpha<=2*pi)).*x1 + ((alpha>=2*pi)&(alpha<=3*pi)).*x2;
    y = ((alpha>=0)&(alpha<=pi)).*y0 + ((alpha>=pi)&(alpha<=2*pi)).*y1 + ((alpha>=2*pi)&(alpha<=3*pi)).*y2;
    z = ((alpha>=0)&(alpha<=pi)).*z0 + ((alpha>=pi)&(alpha<=2*pi)).*z1 + ((alpha>=2*pi)&(alpha<=3*pi)).*z2;
end

