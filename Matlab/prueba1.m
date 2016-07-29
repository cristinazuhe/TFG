
%sup. helicoidal
% uh = 0:pi/18:3*pi;
% vh = 0:pi/18:2*pi;
% R = 10; r = 5;
% [uH,vH] = meshgrid(uh,vh);
% 
% X=(R+r.*cos(vH)).*cos(uH);
% Y=(R+r.*cos(vH)).*sin(uH);
% Z=(5*uH+r.*sin(vH));
% 
% surf(X,Y,Z);
% axis equal;

%cilindro
% n = 20;
% r = [1 1]';
% r = r(:); % Make sure r is a vector.
% m = length(r); if m==1, r = [r;r]; m = 2; end
% theta = (0:n)/n*2*pi;
% sintheta = sin(theta); sintheta(n+1) = 0;
% 
% x = r * cos(theta);
% y = r * sintheta;
% z = ((0:m-1)'/(m-1) * ones(1,n+1))*20;
% surf(x,y,z);
% axis equal;


braid_cad_char = input('Ingrese braid (ej: +s2-s1+s1) ','s');
n_aux_cruces=1;
indices_braid = zeros(1,length(braid_cad_char)/3);
for i=1:length(braid_cad_char)
    if(strcmpi(braid_cad_char(i),'-'))
       indices_braid(n_aux_cruces) = -str2double(braid_cad_char(i+2));
       n_aux_cruces = n_aux_cruces+1;
    elseif(strcmpi(braid_cad_char(i),'+'))
       indices_braid(n_aux_cruces) = str2double(braid_cad_char(i+2));
       n_aux_cruces = n_aux_cruces+1;
    end
end

N_cortes=20;
Radio=0.7;
representar_braid(indices_braid, N_cortes, Radio);


