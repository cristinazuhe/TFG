clear all;
N_cortes = 20;
Radio = 0.5;
indices_braid1 = [5 3 3 -2];
indices_braid2 = [0 5 0 3 0 0 3 -2 0];

transicion_braids(indices_braid1,indices_braid2, N_cortes, Radio);
