% EQUIVALENCIA_BRAIDS.
% Solicitamos dos trenzas al usuario
% Vemos si las trenzas dadas son o no equivalentes. 
% See also LEER_TRENZA, EXPONENTE, PERMUTACION, DEHORNOY.
N_cortes = 20;
Radio = 0.5;

disp('Primera trenza a comparar:');
indices_braid1 = leer_trenza();
disp('Segunda trenza a comparar:');
indices_braid2 = leer_trenza();

%Primero vemos si los exponentes son distintos.
vector_e1 = exponente(indices_braid1);
vector_e2 = exponente(indices_braid2);
fin = false;
if(vector_e1 ~= vector_e2)
    disp('Las trenzas dadas no son equivalentes pues sus exponentes son distintos.');
    fin = true;
end

%A continuacion vemos si las permutaciones son distintas
if(~fin)
    vector_p1 = permutacion(indices_braid1);
    vector_p2 = permutacion(indices_braid2);
    if(vector_p1 ~= vector_p2)
        disp('Las trenzas dadas no son equivalentes pues sus permutaciones son distintas.');
        fin = true;
    end
end

%Ya hemos probado invariantes b�sicos, vamos con el algoritmo de Dehornoy.
if(~fin)
    %obtengo la trenza inversa de la segunda trenza.
    inversa_braid2 = fliplr(-indices_braid2);
    indices_braid = [indices_braid1,inversa_braid2];

    [es_trivial, final_braid] =  dehornoy(indices_braid,true , N_cortes, Radio);

    if(~es_trivial)
        disp('Las trenzas dadas no son equivalentes.');
    else
        disp('Las trenzas dadas s� son equivalentes.');
    end
end
