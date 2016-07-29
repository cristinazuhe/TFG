N_cortes=20;
Radio=0.4;
inicio = -3*pi;
fin = 0;
signo = 1;
numero_braid = 3;

    alpha=inicio:0.1:fin;
    l=zeros([1 length(alpha)]);
    y0=l;z0=alpha;
    x1=(signo)*cos(alpha)+numero_braid+1;y1=(-signo)*sin(alpha);z1=alpha;
    y2=l;z2=alpha;
    if(mod(round(((fin-pi)/(-pi))),2) == 0)
        x0=l-signo+numero_braid+1;
        x2=l+signo+numero_braid+1;
    else
        x0=l+signo+numero_braid+1;
        x2=l-signo+numero_braid+1;
    end
    
    x = ((alpha>=inicio)&(alpha<=inicio+pi)).*x0 + ((alpha>=inicio+pi)&(alpha<=inicio+2*pi)).*x1...
        + ((alpha>=inicio+2*pi)&(alpha<=fin)).*x2;
    y = ((alpha>=inicio)&(alpha<=inicio+pi)).*y0 +((alpha>=inicio+pi)&(alpha<=inicio+2*pi)).*y1 +...
        ((alpha>=inicio+2*pi)&(alpha<=fin)).*y2;
    z = ((alpha>=inicio)&(alpha<=inicio+pi)).*z0 +((alpha>=inicio+pi)&(alpha<=inicio+2*pi)).*z1 +...
        ((alpha>=inicio+2*pi)&(alpha<=fin)).*z2;

    xc = ((alpha>=inicio)&(alpha<=fin)).*x2 ;
    yc = ((alpha>=inicio)&(alpha<=fin)).*y2;
    zc = ((alpha>=inicio)&(alpha<=fin)).*z2;
   
    
  representar_braid([1 -4], N_cortes, Radio ); 
%    
%     au1 = xc; 
%     au2 = yc;
%     au3 = zc;
% for t=1:1:length(zc)
%     au1(1) = []; 
%     au2(1) = [];
%     au3(1) = [];
%     x_tran = au1;
%     y_tran = au2;
%     z_tran = au3;
%     aux1 = plot3(x_tran, y_tran, z_tran);
%     aux2 = tubep(x_tran,y_tran,z_tran,N_cortes,Radio);
%     pause(0.01);
% end

