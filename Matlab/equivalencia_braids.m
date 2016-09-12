N_cortes = 20;
Radio = 0.5;
indices_braid1=[2 -1 -2];
indices_braid2 =[-1 -2 1];

%obtengo la trenza inversa de la segunda trenza. 
inversa_braid2 = fliplr(-indices_braid2);
indices_braid = [indices_braid1,inversa_braid2];
 
es_trivial =  dehornoy(indices_braid,true, N_cortes, Radio);

if(~es_trivial)
    disp('Las trenzas dadas no son equivalentes.');
else
    disp('Las trenzas dadas sí son equivalentes.');
end