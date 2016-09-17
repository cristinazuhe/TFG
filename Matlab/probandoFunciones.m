%Lectura de una trenza.
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

%Dowker Notation
%dowker = DowkerNotation(indices_braid); 

%Burau Matriz de la trenza. 
% m_burau = burau_matrix(indices_braid);
% disp('Burau Matrix:');
% disp(m_burau);

%Polinomio de Alexander de la trenza. 
% pol_Alexander = alexander_pol(indices_braid); %Hace internamente burau_matrix
% disp('Alexander polynomial');
% disp(pol_Alexander);

% Representación 3D de la trenza.
% N_cortes=20;
% Radio=0.7;
% representar_braid2(indices_braid, N_cortes, Radio);

%Representación Dehornoy de la trenza.
% disp('Initial braid:'); disp(indices_braid);
% [es_trivial, final_braid] = dehornoy(indices_braid, true, 20, 0.5);
% disp('Reduced braid:'); disp(final_braid);


