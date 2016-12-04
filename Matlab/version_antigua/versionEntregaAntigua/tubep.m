function traceplot = tubep(x,y,z,N,R)
%TUBEP
%Representación de un tubo con centro la funcion de entrada. 
%Entrada: coordenadas x, y, z de una función, número de cortes y radio del
%tubo.
    x0=reshape(x,[],1);y0=reshape(y,[],1);z=reshape(z,[],1);
    x0=repmat(x0,1,N+1);y0=repmat(y0,1,N+1);
    myAng=linspace(0,2*pi,N+1);
    xcir=R*cos(myAng);
    ycir=R*sin(myAng);
    xx=x0+repmat(xcir,size(x0,1),1);yy=y0+repmat(ycir,size(y0,1),1);
    zz=repmat(z,1,N+1);
    traceplot=surface(xx',yy',zz','EdgeColor','none');
    axis equal off;
    shading interp;
    light;
    lighting phong;
    camlight left;
    
end

