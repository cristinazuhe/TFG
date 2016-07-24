
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

inicio = 0;
fin = 3*pi;
N_cortes=20;
Radio=0.7;

numero_braid1 = 1;
numero_braid2 = 2;
numero_braid3 = 3;
numero_braid4 = 4;

% contador=0;
% cilindro_braid(numero_braid1,inicio,fin,N_cortes,Radio);
% contador=contador+1;
% hold on;
% braid_neg(numero_braid2+contador,inicio,fin,N_cortes,Radio); %1--> de 1 a 3. 2 --> 2 a 4...
% contador=contador+3;
% cilindro_braid(numero_braid3+contador,inicio,fin,N_cortes,Radio);

braid_cad_char = input('Ingrese braid: ','s');
contador_braid=1;
for i=1:length(braid_cad_char)
    if(strcmpi(braid_cad_char(i),'-'))
       aux= braid_cad_char(i+2);
       numero_braid(contador_braid) = -str2double(aux);
       contador_braid = contador_braid+1;
    elseif(strcmpi(braid_cad_char(i),'+'))
       aux= braid_cad_char(i+2);
       numero_braid(contador_braid) = str2double(aux);
       contador_braid = contador_braid+1;
    end
end


