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
clearvars i n_aux_cruces;

% m_burau = burau_matrix(indices_braid);
% disp('Burau Matrix:');
% disp(m_burau);
% % 
% pol_Alexander = alexander_pol(indices_braid); %Hace internamente burau_matrix
% disp('Alexander polynomial');
% disp(pol_Alexander);

disp('Initial braid:'); disp(indices_braid);
indices_braid = dehornoy(indices_braid);
disp('Reduced braid:'); disp(indices_braid);


