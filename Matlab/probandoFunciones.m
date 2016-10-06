% PROBANDOFUNCIONES.
% Solicitamos una trenza al usuario
% Obtenemos su Notacion de Dowker, Matriz de Burau, Polinomio de Alexander,
% representacion 3D, representacion Dehornoy, exponente y permutacion.
% See also LEER_TRENZA, DOWKERNOTATION, BURAU_MATRIX, ALEXANDER_POL, REPRESENTAR_BRAID2,
% DEHORNOY, EXPONENTE, PERMUTACION.
indices_braid = leer_trenza();

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

% Representacion 3D de la trenza.
% N_cortes=20;
% Radio=0.7;
% representar_braid2(indices_braid, N_cortes, Radio);

%Representacion Dehornoy de la trenza.
% disp('Initial braid:'); disp(indices_braid);
% [es_trivial, final_braid] = dehornoy(indices_braid, true, 20, 0.5);
% disp('Reduced braid:'); disp(final_braid);

%Exponente de la trenza.
% valor_exp = exponente(indices_braid);
% disp(strcat('El exponente es: ', num2str(valor_exp)));

%Permutacion de la trenza
% vector_p = permutacion(indices_braid);
% disp(strcat('La permutacion de la trenza es: ', num2str(vector_p)));
